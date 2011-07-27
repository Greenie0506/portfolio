class PostController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show, :index]
end

