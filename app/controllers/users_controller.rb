class UsersController < ApplicationController

	def show
		if user_signed_in?
			@user = User.find(params[:id])
			@tcgs = @user.tcg_tags
		else
			redirect_to new_user_session_path
		end
	end

	def edit
		if user_signed_in?
			@user = current_user
		else
			redirect_to new_user_session_path
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: 'プロフィールを更新しました！'
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

end
