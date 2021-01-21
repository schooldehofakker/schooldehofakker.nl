# index page
class NieuwsbrievenController < ApplicationController
  before_action :set_mailing_list, only: %i[send_to_mailinglist show]
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
    if !@mailinglist.mailinglist_send == true
      @mailinglist.sender = current_user.id
      @mailinglist.send_at = Time.now
      @mailinglist.mailinglist_send = true
      @mailinglist.save!
    end
    redirect_to nieuwsbrieven_path, notice: 'Nieuwsbrief is verzonden'
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
end
