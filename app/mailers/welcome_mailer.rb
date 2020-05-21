class WelcomeMailer < ApplicationMailer
	def welcome_mail(user)
		@user = user
		@url = "http://18.178.171.219/"
		mail(
			subject: "☆トレスタ新規会員登録が完了しました。",
			to: @user.email
		)
	end
end
