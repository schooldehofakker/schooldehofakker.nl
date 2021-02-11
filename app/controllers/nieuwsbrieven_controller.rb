# index page
class NieuwsbrievenController < ApplicationController
  before_action :set_mailing_list, only: %i[send_mailinglist show]
  before_action :set_user, only: %i[send_to_user unsubscribe_from_mailinglist]
  before_action :authenticate_admin!, only: %i[send_mailinglist]

  def index
    @allnewsletters = cache_data(key: 'nieuwsbrieven', time: 1.hour) do
      @content.entries(content_type: 'nieuwsbrieven', order: '-fields.published')
    end
  end

  def show
    @newsletter = @content.entries(content_type: 'nieuwsbrieven', 'fields.slug[in]' => params[:slug]).first
    @othernewsletters = @content.entries(content_type: 'nieuwsbrieven', order: '-fields.published', 'fields.slug[ne]' => params[:slug])
  end

  def send_mailinglist
    # only send a mailinglist once
    if !@mailinglist.mailinglist_send == true
      # we send it to active users
      User.where(deleted_at: nil).each do |user|
        HofnieuwsWorker.perform_async(user.email)
      end
      @mailinglist.sender = current_user.id
      @mailinglist.send_at = Time.now
      # @mailinglist.mailinglist_send = true
      @mailinglist.save!
    end
    redirect_to nieuwsbrieven_path, notice: "Nieuwsbrief #{@mailinglist.slug} is verzonden"
  end

  def subscribe_to_mailinglist
    if verify_recaptcha
      user = User.new
      user.email = params[:email]
      user.first_name = params[:first_name]
      user.last_name = params[:last_name]
      user.password = user.new_random_password
      user.save!
      redirect_to nieuwsbrieven_path, notice: 'U bent aangemeld op de mailinglijst'
    else
      redirect_to nieuwsbrieven_path, notice: 'U heeft niet alles goed ingevuld, probeer het nog keer'
    end
  end

  def unsubscribe_from_mailinglist
    # currently we use the background user table only for mailings
    @user.deleted_at = Time.now
    @user.save!
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
