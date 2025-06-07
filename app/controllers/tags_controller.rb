class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_param)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_path, notice: "Tag was successfully created." }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def tag_param
    params.require(:tag).permit(:name)
  end
end
