# index page
class ContactController < ApplicationController
  def index; end

  def new
    @name = contact_params[:name]
    @email = contact_params[:email]
    @message = contact_params[:message]

    ContactMailer.contact_email(@name, @email, @message).deliver_later
    redirect_to bedankt_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.permit(:name, :email, :message)
  end
end
