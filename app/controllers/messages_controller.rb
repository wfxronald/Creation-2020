class MessagesController < ApplicationController

  def new
    @message = Message.new
    @mailing_list = MailingList.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.contact_us(@message).deliver_now
      redirect_to new_message_url, notice: "Thank you for your message, we will contact you with a reply through your email soon!"
    else
      @mailing_list = MailingList.new
      render "messages/new"
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:name, :user_email, :body)
  end

end
