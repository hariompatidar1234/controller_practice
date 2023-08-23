class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

<<<<<<< HEAD
 
  def create
    @post = Post.new(set_params)
    if @post.save
      render json: @post,status: :created
=======
  def show 
    @post=Post.find(params[:id])
    render json: @post
  end 

  def create
    @post = Post.new(set_params)
    if @post.save
      render json: { message:"post Created", data: @post}
>>>>>>> 1e0ae2c (add update mathod in controller)
    else
      render json: { errors: @post.errors.full_messages }
    end
  end

<<<<<<< HEAD
  def index
    @post=Post.all
    render json: @post
  end 

  def show
    @post = Post.find(params[:id])
    render json: @post
=======
  def set_params
    params.permit(:name,:age,:address)
>>>>>>> 1e0ae2c (add update mathod in controller)
  end

  def update 
    @post = Post.find(params[:id])
    if @post.update(set_params)
      render json: @post
    else 
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end 
  end 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: { message: "Post successfully deleted" }
  end

  private
  def set_params
    params.permit(:name,:age,:address)
  end

 
end
