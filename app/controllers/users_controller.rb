class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to @user #user_url(@user)と同じ
    else
      render 'new'
    end
  end



private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end

end