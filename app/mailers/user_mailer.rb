class UserMailer < ApplicationMailer

  def reset_password_email(user)
    @user = User.find(user.id)
    @url = edit_password_reset_url(@user.reset_password_token)

    mail(
      from: "from@example.com",
      to: @user.email,
      subject: "パスワードリセットの案内"
    )
  end
end
