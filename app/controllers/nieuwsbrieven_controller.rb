# index page
class NieuwsbrievenController < ApplicationController
  before_action :set_mailing_list, only: %i[send_to_mailinglist show]
  before_action :set_user, only: %i[unsubscribe_from_mailinglist]
  before_action :authenticate_admin!, only: %i[send_to_mailinglist]

  def index
    @allnewsletters = cache_data(key: 'nieuwsbrieven', time: 1.hour) do
      @content.entries(content_type: 'nieuwsbrieven', order: '-fields.published')
    end
  end

  def show
    @newsletter = @content.entries(content_type: 'nieuwsbrieven', 'fields.slug[in]' => params[:slug]).first
    @othernewsletters = @content.entries(content_type: 'nieuwsbrieven', order: '-fields.published', 'fields.slug[ne]' => params[:slug])
  end

  def send_to_mailinglist
    # only send a mailinglist once
    if !@mailinglist.mailinglist_send == true
      # we send it to all users for now, might differentiate later
      @users = User.all
      @users.each do |user|
        Rails.logger.info("Sending a mailing to #{user.email}")
        HofnieuwsMailer.send_hofnieuws_email(user).deliver_later
      end
      @mailinglist.sender = current_user.id
      @mailinglist.send_at = Time.now
      @mailinglist.mailinglist_send = true
      @mailinglist.save!
    end
    redirect_to nieuwsbrieven_path, notice: 'Nieuwsbrief is verzonden'
  end

  def unsubscribe_from_mailinglist
    # currently we use the background user table only for mailings
    User.delete(@user.id)
    redirect_to nieuwsbrieven_path, notice: 'U bent afgemeldt, u kunt zich altijd weer aanmelden via deze pagina'
  end

  private

  def authenticate_admin!
    authenticate_user!
    redirect_to nieuwsbrieven_path unless current_user.admin?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_mailing_list
    @mailinglist = Mailinglist.find_or_create_by(slug: params[:slug])
  end

  def set_user
    @user = User.find_by(uuid: params[:uuid])
  end
end
