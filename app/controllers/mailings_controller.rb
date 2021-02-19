class MailingsController < ApplicationController
  before_action :set_mailing, only: %i[show edit update destroy]
  before_action :set_mailing_by_slug, only: %i[send_mailing]
  before_action :set_user_by_uuid, only: %i[unsubscribe]
  before_action :authenticate_admin!, only: %i[send_mailing]

  # GET /mailings or /mailings.json
  def index
    @mailings = Mailing.all.order('published_at DESC')
  end

  # GET /mailings/1 or /mailings/1.json
  def show
    @othermailings = Mailing.where.not(id: @mailing.id)
  end

  # GET /mailings/new
  def new
    @mailing = Mailing.new
  end

  # GET /mailings/1/edit
  def edit; end

  # POST /mailings or /mailings.json
  def create
    @mailing = Mailing.new(mailing_params)

    respond_to do |format|
      if @mailing.save
        format.html { redirect_to @mailing, notice: 'Mailing was successfully created.' }
        format.json { render :show, status: :created, location: @mailing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mailing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailings/1 or /mailings/1.json
  def update
    respond_to do |format|
      if @mailing.update(mailing_params)
        format.html { redirect_to @mailing, notice: 'Mailing was successfully updated.' }
        format.json { render :show, status: :ok, location: @mailing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mailing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailings/1 or /mailings/1.json
  def destroy
    @mailing.destroy
    respond_to do |format|
      format.html { redirect_to mailings_url, notice: 'Mailing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_mailing
    # only send a mailinglist once
    if !@mailing.mailing_send == true
      # we send it to active users
      User.where(deleted_at: nil).each do |user|
        HofnieuwsWorker.perform_async(user.email, @mailing.id)
      end
      @mailing.sender = current_user.id
      @mailing.send_at = Time.zone.now
      @mailing.mailing_send = true
      @mailing.save!
    end
    redirect_to @mailing, notice: "Nieuwsbrief #{@mailing.slug} is verzonden"
  end

  def subscribe
    if verify_recaptcha
      user = User.new
      user.email = params[:email]
      user.first_name = params[:first_name]
      user.last_name = params[:last_name]
      user.password = user.new_random_password
      user.save!
      redirect_to @mailing, notice: 'U bent aangemeld op de mailinglijst'
    else
      redirect_to mailings_path,
                  notice: 'U heeft niet alles goed ingevuld, probeer het nog keer'
    end
  end

  def unsubscribe
    @user.deleted_at = Time.zone.now
    @user.save!
    redirect_to mailings_path,
                notice: 'U bent afgemeldt, u kunt zich altijd weer aanmelden via deze pagina'
  end

  private

  def authenticate_admin!
    authenticate_user!
    redirect_to mailings_path unless current_user.admin?
  end

  # Only allow a list of trusted parameters through.
  def mailing_params
    params.require(:mailing).permit(:title,
                                    :description,
                                    :content,
                                    :published_at,
                                    :attachment,
                                    :image,
                                    :slug)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_mailing
    @mailing = Mailing.friendly.find(params[:id])
  end

  def set_mailing_by_slug
    @mailing = Mailing.find_by(slug: params[:slug])
  end

  def set_user_by_uuid
    @user = User.find_by(uuid: params[:uuid])
  end
end
