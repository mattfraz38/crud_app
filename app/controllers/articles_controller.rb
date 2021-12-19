class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ] 
  before_action :authenticate_user!, except: [ :indes, :show ]

  def index
    @articles = Article.all
  end

  def show
  end

  def new 
    @article = Article.new
  end

  def create
    @article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def require_params
    params.require(:article).permit(:title, :content)
  end
end