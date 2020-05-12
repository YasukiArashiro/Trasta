class UsersController < ApplicationController

	before_action :user_signed_in, only:[:withdrawal]
	before_action :ensure_correct_user, only:[:edit]

	def show
		@user = User.find(params[:id])
		@evaluations = Evaluation.where(evaluation_partner: @user.id)
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user), notice: 'プロフィールを更新しました！'
		else
			render action: :edit
		end
	end

	def withdrawal
	end

	private

	def user_params
		params.require(:user).permit(:nickname, :profile_image, :introduction, :match_style_id, :tcg_tag_id)
	end

	def user_signed_in
		unless user_signed_in?
			redirect_to new_user_session_path
		end
	end

	def ensure_correct_user
		if user_signed_in?
			@user = User.find(params[:id])
			if current_user.id != @user.id
				redirect_to root
			end
		else
			redirect_to new_user_session_path
		end
	end

	def user_count
		User.count
	end

end
