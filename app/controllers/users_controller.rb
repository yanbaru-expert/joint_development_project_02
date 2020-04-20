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
      flash.now[:alert]="ユーザーの登録に失敗しました。"
      @user = User.new
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path
      flash[:success] = "ユーザーの編集に成功しました。"
    else
      flash.now[:alert]="ユーザーの編集に失敗しました。"
      render :edit
    end
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
