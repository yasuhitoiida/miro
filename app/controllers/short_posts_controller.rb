class ShortPostsController < ApplicationController
  def new
    @short_post = ShortPost.new
    @users = User.all
  end

  def create
    @short_post = ShortPost.new(post_params)

    respond_to do |format|
      if @short_post.save
        format.html { redirect_to post_path(@short_post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @short_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @short_post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:short_post).permit(:title, :content, :user_id)
  end
end
