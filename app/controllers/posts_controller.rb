class PostsController < ApplicationController

  def new
    @posts = Post.where({ "user_id" => @current_user["id"]})
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["place_id"] = params["post"]["place_id"]
    @post["user_id"] = @current_user["id"]
    @post.uploaded_image.attach(params["post"]["uploaded_image"])
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end
end
