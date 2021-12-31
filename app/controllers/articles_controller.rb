class ArticlesController < ApplicationController
  before_action :find_article, only: [ :show, :edit, :update, :destroy ] 
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def articles_search
    @articles = Article.where("content LIKE ?", "%#{params[:query]}%")
  end

  def show
  end

  def new 
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end