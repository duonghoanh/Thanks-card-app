class StaticPagesController < ApplicationController
  include SessionsHelper
  def index
    @users = User.all
  end
  def home
    if logged_in?
      @feed = current_user.feeds.build
      # @feed_items = current_user.feed.page(params[:page])
    @feed_items = current_user.feeds.paginate(page: params[:page]) if logged_in?

    end
  end
  def help
  end
end
