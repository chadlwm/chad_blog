class Admin::PostsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @posts = Column.find(params[:column_id]).posts rescue Post
    @posts = @posts.includes(:column, :author).order("created_at desc")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to  admin_posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_path(slug: @post.slug), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def convert
    render :text => GitHub::Markdown.render_gfm(params[:content]).html_safe
  end

  private
    def post_params
      result = params.require(:post).permit(:title, :raw_content, :slug, :tag_list, :cover, :column_id, :summary)
      result[:html_content] = GitHub::Markdown.render_gfm(result[:raw_content]).html_safe
      result
    end
end
