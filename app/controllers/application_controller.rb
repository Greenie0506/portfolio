class ApplicationController < ActionController::Base
  require 'rubygems'
  require 'flickraw'
  protect_from_forgery

  def index
    #twitter_api
    search = Twitter::Search.new
    recent_tweets = search.from('nickpgreenfield').result_type("recent")
    @handle_tweets = recent_tweets.per_page(3).fetch

    #blog
    @post = Post.all

    #date
    @time = Time.now.strftime("%A, %B %d, %Y")

    #mailer
    @support = Support.new(:id => 1)

    #flickraw
    FlickRaw.api_key="2ed97e1dc0e147f32a47f5f5d781a6eb"
    FlickRaw.shared_secret="8db39cd0f8566a4c"
    @all_photos = flickr.people.getPublicPhotos(:user_id => "65761480@N04")
    @photos_url = []
    @all_photos.each do |photo|
      photo_info = flickr.photos.getInfo(:photo_id => photo.id)
      @url = "http://farm#{photo_info.farm}.static.flickr.com/#{photo_info.server}/#{photo.id}_#{photo_info.secret}_m.jpg"
      @photos_url << @url
    end
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
