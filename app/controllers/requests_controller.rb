class RequestsController < ApplicationController

	before_action :user_signed_in, only:[:new]
	before_action :ensure_correct_user, only:[:edit, :update, :destroy]

	def index
		@requests = Request.where(request_status: 0).reverse_order.page(params[:page]).per(10)

	end

	def show
		not_established
	end

	def new
		@request = Request.new
	end

	def create
		@request =Request.new(request_params)
		@request.user_id = current_user.id
		if @request.save
			redirect_to request_path(@request), notice: 'マッチリクエストを投稿しました！'
		else
			render action: :new
		end
	end

	def edit
		not_established
	end

	def update
		@request = Request.find(params[:id])
		if @request.update(request_params)
			redirect_to request_path(@request), notice: 'マッチリクエストを更新しました！'
		else
			render action: :edit
		end
	end

	def destroy
		@request = Request.find(params[:id])
		@request.destroy
		redirect_to user_path(current_user), notice: 'マッチリクエストを取り消しました！'
	end

	def promise
		@request = Request.find(params[:id])
		@pair = Pair.new
		@pair.request_id = @request.id
		@pair.contributor_id = @request.user_id
		@pair.opponent_id = current_user.id
		@pair.save
		@request.update(opponent_user_id: current_user.id)
		@request.update(request_status: 1) #マッチリクエストのステータスを「成立済み」に変更
		redirect_to promised_match_request_path(@request)
	end

	def schedule
		@requests = Request.where(user_id: current_user.id).or(Request.where(opponent_user_id: current_user.id))
		.where(request_status: 1).reverse_order.page(params[:page]).per(10)
		#「リクエストの投稿者のIDか対戦相手のIDがカレントユーザー」かつ「リクエストステータスが成立済み」
	end

	def promised_match
		@request = Request.find(params[:id])
		unless @request.request_status == "成立済み"
			redirect_to requests_path
		end
		if @request.user_id == current_user.id
			@user = User.find(@request.opponent_user_id)
		else
			@user = User.find(@request.user_id)
		end
	end

	def search
		@requests = Request.where(request_status: 0)
		if params[:search] == 'and'
			unless params[:tcg_tag_id] == nil
				@requests = @requests.where(tcg_tag_id: params[:tcg_tag_id])
			end
			unless params[:prefecture] == "都道府県"
				@requests = @requests.where(prefecture: params[:prefecture])
			end
			unless params[:match_day].blank?
				@requests = @requests.where(match_day: params[:match_day])
			end
			unless params[:match_style_id].blank?
				@requests = @requests.where(match_style_id: params[:match_style_id])
			end
		elsif params[:search] == 'or'
			@requests = @requests.where(tcg_tag_id: params[:tcg_tag_id])
			.or(@requests.where(prefecture: params[:prefecture]))
			.or(@requests.where(match_day: params[:match_day]))
			.or(@requests.where(match_style_id: params[:match_style_id]))
		end
		@requests = @requests.reverse_order.page(params[:page]).per(10)
		render action: :index
	 end

	private

	def request_params
		params.require(:request).permit(:tcg_tag_id, :match_style_id, :request_title, :match_day, :meeting_time,
		 :ending_time, :prefecture, :meeting_place, :request_comment)
	end

	def user_signed_in
		unless user_signed_in?
			redirect_to new_user_session_path
		end
	end

	def ensure_correct_user
		if user_signed_in?
			@request = Request.find(params[:id])
			if current_user.id != @request.user_id
				redirect_to root_path
			end
		else
			redirect_to new_user_session_path
		end
	end

	def not_established
		@request = Request.find(params[:id])
		unless @request.request_status == "未成立"
			redirect_to requests_path
		end
	end

end
