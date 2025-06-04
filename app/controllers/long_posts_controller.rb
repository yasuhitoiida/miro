class LongPostsController < ApplicationController
  def new
    @long_post = LongPost.new
    @users = User.all
    @tags = Tag.all
  end

  def create
    @long_post = LongPost.new(post_params)

    respond_to do |format|
      if @long_post.save
        format.html { redirect_to post_path(@long_post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @long_post }
      else
        @users = User.all
        @tags = Tag.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @long_post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:long_post).permit(:title, :content, :user_id, tag_ids: [])
  end
end
