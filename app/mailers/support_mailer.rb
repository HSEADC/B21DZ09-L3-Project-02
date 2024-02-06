class SupportMailer < ApplicationMailer

    def user_support_request_email
        # @user = params[:user]
        # @url  = 'http://example.com/login'
        # mail(to: @user.email, subject: 'Welcome to My Awesome Site')

        mail(to: "user@test.com", subject: "Обращение в поддержку")
    end

    def admin_support_request_email


    end

end
