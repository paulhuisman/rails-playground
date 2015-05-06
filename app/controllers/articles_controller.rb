class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @authors = Author.all
  end

  def index
    #@articles = Article.all
    @articles = Article.all.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @article = Article.find(params[:id])
    @authors = Author.all
  end
   
  def create
    @article = Article.new(article_params)
   
    if @article.save
      redirect_to @article
    else
      render 'new'
    end

    @authors = Author.all
  end

  def show
    @article = Article.find(params[:id])
  end
   
  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
    @authors = Author.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :image, :text, :author_id, :category)
    end
  end
