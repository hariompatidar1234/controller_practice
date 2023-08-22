class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

 
  def create
    @post = Post.new(set_params)
    if @post.save
      render json: @post,status: :created
    else
      render json: { errors: @post.errors.full_messages }
    end
  end

  def index
    @post=Post.all
    render json: @post
  end 

  def show
    @post = Post.find(params[:id])
    render json: @post
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
