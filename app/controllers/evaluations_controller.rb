class EvaluationsController < ApplicationController

	before_action :contributor, only:[:new, :create]

	def new
		@evaluation = Evaluation.new
	end

	def create
		@evaluation = Evaluation.new(evaluation_params)
		@evaluation.user_id = current_user.id
		@evaluation.evaluation_partner = @user.id
		@evaluation.request_id = @request.id
		if @evaluation.save
			if @request.rater != 0
				@request.update(request_status: 2) #マッチリクエストのステータスを「対戦終了」に変更
			else
				@request.update(rater: current_user.id)
			end
			redirect_to home_thanks_path
		else
			render action: :new
		end
	end

	private

	def evaluation_params
		params.require(:evaluation).permit(:evaluation, :evaluation_comment)
	end

	def contributor
		@request = Request.find(params[:request_id])
		if @request.user_id == current_user.id
			@user = User.find(@request.opponent_user_id)
		else
			@user = User.find(@request.user_id)
		end
	end
end