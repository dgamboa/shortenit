class UrlsController < ApplicationController
  before_filter :authentica_user!, :only => [:destroy]

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
    @url.increment!(:num_views)
    redirect_to @url.long_url
  end

  def destroy
    @url.destroy

    respond_to do |format|
      format.html { redirect_to urls_path }
      format.json { head :no_content }
    end
  end
end
