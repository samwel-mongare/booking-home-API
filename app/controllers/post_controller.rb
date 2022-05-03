class PostController < ApplicationController
  load_and_authorize_resource
  def show
    @post= Post.find(params[:post_id])
    authorize! :read, @post
  end
end
