require "prawn"
class PostsController < ApplicationController
  include ActionController::Live
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def create
    @post = Post.new(set_params)
    if @post.save
      render json: { message:"post Created", data: @post}
    else
      render json: { errors: @post.errors.full_messages }
    end
  end
  
  
  def index
    @post=Post.all
    render json: @post
  end 
  
  def show
    @post = Post.find_by_id(params[:id])
    if @post
      render json: @post
    else 
      render json: {message: "not found posts"}
    end 
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
  
  def download_pdf
    post = Post.find(params[:id])
    send_data generate_pdf(post),
    filename: "#{post.title}.pdf",
    type: "application/pdf"
  end
  
  # def download_pdf
  # post = Post.find(params[:id])
  # send_file("#{Rails.root}/#{post.id}.pdf",
  #   filename: "#{post.title}.pdf",
  #   type: "application/pdf")
  # end 
  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    10.times {
      response.stream.write "hello world\n"
      sleep 1
    }
  ensure
    response.stream.close
  end
  
  private
  def generate_pdf(post)
    Prawn::Document.new do
      text post.title, align: :center
      text "Title: #{post.title}"
    end.render
  end
  
  private
  def set_params
    params.permit(:tite)
  end
  private
  def record_not_found
    render plain: "404 Not Found", status: 404
  end
  
end
