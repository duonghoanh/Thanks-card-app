class StaticPagesController < ApplicationController
  include SessionsHelper

  def home
    if logged_in?
      @feed = current_user.feeds.build
      @feed_items = current_user.feed.page(params[:page])
    end
    

  end



  def help
  end
end
