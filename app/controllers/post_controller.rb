class PostController < ApplicationController
  before_filter :authenticate_admin!
end

