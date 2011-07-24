class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    #twitter_api
    search = Twitter::Search.new
    recent_tweets = search.from('nickpgreenfield').result_type("recent")
    @handle_tweets = recent_tweets.per_page(3).fetch

    #blog
    @post = Post.all

    #date
    @time = Time.now.strftime("%A, %B %d, %Y at %l%p")

    #mailer
    @support = Support.new(:id => 1)
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
end
