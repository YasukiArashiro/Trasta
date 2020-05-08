class RequestsController < ApplicationController

	before_action :user_signed_in, only:[:new]
	before_action :ensure_correct_user, only:[:edit]

	def index
		@requests = Request.all
	end

	def show
		@request = Request.find(params[:id])
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
		@request = Request.find(params[:id])
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
		@requests = Request.where(user_id: current_user.id).or(Request.where(opponent_user_id: current_user.id)).where(request_status: 1)
		#「リクエストの投稿者のIDか対戦相手のIDがログインしているユーザー」かつ「リクエストステータスが成立済み」
	end

	def promised_match
		@request = Request.find(params[:id])
	end

	def map
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
				redirect_to root
			end
		else
			redirect_to new_user_session_path
		end
	end
end
