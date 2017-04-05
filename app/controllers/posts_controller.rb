class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        respond_to do |format|
            if @post.save
                format.html { redirect_to @post, notice: 'Post was successfully created.' }
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :new }
                format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def show
        #we dont need this as we already have it set on the before_action :set_post
        #@post = Post.find(params[:id])
    end
    
    private
        def post_params
            params.require(:post).permit(:date, :rationale)
        end
        
        def set_post
            @post = Post.find(params[:id])
        end
end
