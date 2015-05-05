class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def index
    @authors = Author.all
  end

  def edit
    @author = Author.find(params[:id])
  end
   
  def create
    @author = Author.new(author_params)
   
    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def show
    @author = Author.find(params[:id])
    @articles = Article.where(author_id: params[:id]).to_a
  end
   
  def update
    @author = Author.find(params[:id])
   
    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
   
    redirect_to authors_path
  end

  private
    def author_params
      params.require(:author).permit(:name, :biography, :birthyear, :avatar)
    end
  end
