class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    search = Twitter::Search.new
    recent_tweets = search.from('nickpgreenfield').result_type("recent")
    @handle_tweets = recent_tweets.per_page(3).fetch

    @post = Post.all

  end

 def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to(@post)
    end

  end

end
