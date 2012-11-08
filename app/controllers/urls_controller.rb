class UrlsController < ActionController::Base
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new params[:url]
    if @url.save
      redirect_to urls_path
    else
      render :new
    end
  end

  def show
    @url = Url.find_by_short_url(params[:short_url])
    redirect_to @url.long_url
  end
end
