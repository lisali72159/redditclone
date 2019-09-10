class PostsController < ApplicationController
  before_action :ensure_logged_in


  def new
    @post = Post.new
  end

  def create
    debugger
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    # debugger
    # @post.sub_ids = params[:sub_ids] 
    if @post.save
      # debugger
      redirect_to post_url(@post)
    else 
      # debugger
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end


    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])

      if current_user.id == @post.author_id && @post.update(post_params)
        redirect_to sub_post_url(@post)
      else 
        flash.now[:errors] = @post.errors.full_messages
      end
    end

    def destroy
      @post = Post.find([:id])
      @post.destroy
      redirect_to sub_url(@post.sub_id)
    end

    def post_params
      params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end


end