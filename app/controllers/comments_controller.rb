class CommentsController < ApplicationController
    before_action :load_commentable
    before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def index
  end

  def show
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.author = current_user.email
    @comment.approved = false
    if @comment.save
      flash[:notice] = 'comment has been created'
      respond_to do |format|
        format.html { redirect_to @commentable }
        format.js
      end
    else
      flash.now[:error] = 'comment could not be saved'
      render :new
    end
  end


  def update
    if @comment.update_attributes(comment_params)
      respond_to do |format|
        format.html { redirect_to @commentable, notice: 'comment was successfuly updated' }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @commentable, notice: 'comment was successfully destroyed.' }
      format.js
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :content, :approved, :commentable_id)
    end

    def load_commentable
      @resource, id = request.path.split('/')[1,2]
      @commentable = @resource.singularize.classify.constantize.find(id)
    end
end








# class CommentsController < ApplicationController
#   before_action :load_commentable

#   def index
#   end

#   def show
#   end

#   def new
#     @comment = @commentable.comments.new
#   end


#   def create
#     @post = Post.find(params[:post_id])
#     @comment = @post.comments.build(comment_params)
#     if @comment.save
#       redirect_to @post, notice: 'Comment was successfully created.'
#     else
#       redirect_to @post, notice: 'Comment was not saved successfully.'
#     end
#   end

#   def update
#     @post = Post.find(params[:post_id])
#     @comment = Comment.find(params[:id])
#     @comment.approve!
#     if @comment.update(comment_params)
#       redirect_to @post, notice: 'Comment was successfully approved.'
#     else
#       redirect_to @post, notice: 'Comment was NOT approved.'
#     end
#   end

#   def destroy
#     set_comment
#     @post = @comment.post
#     if @comment.destroy
#       redirect_to @post, notice: 'Comment annihilated!'
#     else
#       redirect_to @post, notice: 'Comment was not removed!'
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_comment
#       @comment = Comment.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def comment_params
#       params.require(:comment).permit(:content, (:approved if CommentPolicy.new(current_user, @comment).approve?))
#     end
# end
