# frozen_string_literal: true

# index page
class ContactController < ApplicationController
  def index
    @contact = cache_data(key: 'contact') do
      @content.entries(content_type: 'pagina', 'fields.slug[in]' => 'contact').first
    end

    @postadres = cache_data(key: 'postadres') do
      @content.entries(content_type: 'pagina', 'fields.slug[in]' => 'postadres').first
    end

    @veiligheid = cache_data(key: 'veiligheid') do
      @content.entries(content_type: 'pagina', 'fields.slug[in]' => 'veiligheid').first
    end
  end

  def new
    if verify_recaptcha
      @name = contact_params[:name]
      @email = contact_params[:email]
      @message = contact_params[:message]
      ContactMailer.contact_email(@name, @email, @message).deliver_later
      redirect_to bedankt_path
    else
      flash.delete(:recaptcha_error)
      redirect_to contact_path, notice: 'Recaptache is niet ingevuld!'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.permit(:name, :email, :message)
  end
end
