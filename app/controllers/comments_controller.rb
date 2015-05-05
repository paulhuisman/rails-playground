class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
 
  def index
    @comments = Comment.all.reorder('created_at DESC')
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