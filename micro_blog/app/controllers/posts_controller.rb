# posts_controller.rb

class PostsController < ApplicationController
  def index
    # @current_user = User.find_by_id(2)
    @all_posts = Post.all
    # @user_id = @current_user.id
    @user_id = params[:user_id]

  end

  def show
    # @user = User.find(session[:user_id])
    @post = Post.find_by_id(params[:id])
    puts @post.user
    @tags = @post.tags
  end

  def new
    p params
    @post = Post.new
    # @user_id = params[:user_id]
    @user_id = User.find(2).id
    render :new
  end

  def create
    post_data = params[:post].permit(:title, :body)
    # tag_data = params[:tag].split(",")
    # tag_data = tag_data.map(&:strip).map(&:downcase)
    tag_data = params[:tags].split(",").map(&:strip).map(&:downcase)

    post_data [:user_id]=params[:user_id].to_i

    post = Post.create(post_data)
    tag_data.each do |tag_str|
      tag = Tag.find_by_name(tag_str)
      if tag == nil
        tag = Tag.create(:name => tag_str)
      end
      post.tags << tag
    end

    # flash component for error messages
    flash[:error] = "oops something went wrong!"

    # redirect to show all the posts using posts#index
    redirect_to "/posts"
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    id_data = params[:id]
    post_data = params[:post].permit(:title, :body)
    tag_data = params[:tags].split(",").map(&:strip).map(&:downcase)

    post = Post.find_by_id(id_data)
    if post
      post.update_attributes(post_data)
      # remove all old tags
      post.tags.clear
      # add new tags
      tag_data.each do |tag_str|
        tag = Tag.find_or_create_by(name: tag_str)
        post.tags << tag
      end
    end
    redirect_to "/posts/" + id_data
  end

  def destroy
    id = params[:id]
    post = Post.find(id)
    post.destroy
    redirect_to "/posts"
  end

end
