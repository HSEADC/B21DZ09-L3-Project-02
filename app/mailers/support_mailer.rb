class SupportMailer < ApplicationMailer

    def user_support_request_email
        # @user = params[:user]
        # @url  = 'http://example.com/login'
        # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
        post_image = params[:support][:post_image]
        email = params[:support][:email]
        mail(from: "admin@test.com",to: email, subject: "Ваше обращение в поддержку принято")
    end

    def admin_support_request_email

        @post_image = params[:support][:post_image]
        @email = params[:support][:email]
        @comment = params[:support][:comment]
        mail(from: @email,to: "admin@test.com", subject: "Новое обращение в поддержку")

    end

end
