class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    search = Twitter::Search.new
    recent_tweets = search.from('nickpgreenfield').result_type("recent")
    @handle_tweets = recent_tweets.per_page(5).fetch
  end



end
