# index page
class NieuwsController < ApplicationController
  before_action :set_news, only: %i[show edit update destroy]
  before_action :authenticate_admin!, only: %i[create edit update destroy]

  def index
    @allnews = News.all.where(status: 'published').order(published_at: :desc)
  end

  def edit; end

  def show; end

  def new
    @news = News.new
  end

  def create
    @news = News.new(post_params)

    if @news.save
      redirect_to nieuw_path(@news), notice: 'News was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    pd = Date.new(params[:news]['published_at(1i)'].to_i, params[:news]['published_at(2i)'].to_i, params[:news]['published_at(3i)'].to_i)
    if @news.update(title: post_params[:title], content: post_params[:content], status: post_params[:status], published_at: pd)
      redirect_to nieuw_path(@news), notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @news.destroy
    redirect_to nieuws_url, notice: 'News was successfully destroyed.'
  end

  private

  def authenticate_admin!
    authenticate_user!
    redirect_to nieuws_path unless current_user.admin?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_news
    @news = News.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:news).permit(:title, :content, :status, :published_at)
  end

  def flatten_date_array(hash)
    puts '#' * 60
    puts 'app/controllers/nieuws_controller.rb:63'
    puts '*' * 60
    puts hash.inspect
    %w[1 2 3].map { |e| hash["date(#{e}i)"].to_i }
  end
end
