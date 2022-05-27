class FeedsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :logged_in?, only: %i[create destroy]
  before_action :correct_user, only: :destroy


  def create
    @feed = current_user.feeds.build(feed_params)
  @feed.image.attach(feed_params[:image])
  if @feed.save
    flash[:success] = 'feed created successfully'
    redirect_to root_path

    else
      render home_path
    end
  end
def feed_content
redirect_to feeds_feed_content_path
end


    def destroy
      if @feed.destroy
        flash[:success] = 'feed deleted'
      else
        flash[:danger] = 'Deleted fail'
      end
      redirect_to request.referrer || root_url
  end

  private

  def feed_params
    params.require(:feed).permit(:content, :image)
  end
  def correct_user
    @feed = current_user.feeds.find_by(id: params[:id])
  return if @feed
  flash[:danger] = 'the feed doesn\'t exist'
  redirect_to root_url
  end

end
