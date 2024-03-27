class SupportController < ApplicationController

  
  def request_support
    @support = Support.new(support_params)

    respond_to do |format|
      if @support.save
        format.html {redirect_to welcome_support_url(@support), notice:"Support request was succesfully sent."}

        SupportMailer.with(support: @support).user_support_request_email.deliver_now
        SupportMailer.with(support: @support).admin_support_request_email.deliver_now
        
      end
    end
  end

  

  private

  def support_params
    params.require(:support).permit(:email, :comment, :post_image)
  end

end
