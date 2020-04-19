class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path,notice: "新規ユーザーが登録されました。"
    else
      flash.now[:alert]="ユーザー情報が正しくないため保存されませんでした。"
      @users = User.all
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :age)
  end

end
