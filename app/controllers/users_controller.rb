class UsersController < ApplicationController
  before_action :find_user, only: [ :show ]
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @users = User.all
  end

  def search
    # @users = User.where("username LIKE ?", "%" + params[:query] + "%")
    if params[:query].present?
      @users = User.where("username LIKE ?", "%#{params[:query]}%")
    else
      @users = User.all
    end
  end

  def show
    @article = @user.articles.build
    @user_articles = @user.articles.all.order("created_at DESC")
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end