class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        respond_to do |format|
            if @post.save
                format.html { redirect_to @post, notice: 'Post was successfully created.' }
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :edit  }
                format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def show
        #we dont need this as we already have it set on the before_action :set_post
        #@post = Post.find(params[:id])
    end

    def edit
    end

    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @post.delete

      respond_to do |format|
        format.html { redirect_to posts_path , notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    
    private
        def post_params
            params.require(:post).permit(:date, :rationale)
        end
        
        def set_post
            @post = Post.find(params[:id])
        end
end
