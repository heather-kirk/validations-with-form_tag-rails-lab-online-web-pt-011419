class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new 
  end 
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
     @post = Post.new(author_params)
    if @post.valid?
      @post.save 
    redirect_to post_path(@post)
    else
      render :new
    end 
  end 
  
  def update
    @post = Post.find(params[:id])
    if @post.valid?
    @post.update(post_params)
    @post.save 
     redirect_to post_path(@post)
   else 
     render :edit
   end 
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
