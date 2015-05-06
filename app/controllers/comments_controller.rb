class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article), :flash => { :success => "Thanks for your comment. We will publish it after validation." }
  end
 
  def index
    @comments = Comment.all.reorder('created_at DESC').paginate(:page => params[:page], :per_page => 7)
    @all_comment_count = @comments.count
    @comments_published_percentage = (Comment.where(published: 1).count * 100 ) / @all_comment_count 
  end

  def edit
    @comment = Comment.find(params[:id])
  end
   
  def show
    @comment = Comment.find(params[:id])
  end

  def publish_comment
    @comment = Comment.find(params[:id])
    @comment.published = 1
    @comment.save!
    redirect_to comments_path, :flash => { :success => "Comment by #{@comment.commenter} successfully published." }
  end

  def unpublish_comment
    @comment = Comment.find(params[:id])
    @comment.published = 0
    @comment.save!
    redirect_to comments_path, :flash => { :success => "Comment depublished." }
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
   
    redirect_to comments_path, :flash => { :success => "Comment deleted." }
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end