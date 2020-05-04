class RequestsController < ApplicationController

	before_action :user_signed_in, only:[:new]
	before_action :ensure_correct_user, only:[:edit]

	def index
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
	end

	def schedule
	end

	def promised_match
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
