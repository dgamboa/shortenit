class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @user = current_user
    @url = @user.urls.build(params[:url])

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
    @url = Url.find(params[:id])
    @url.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end
