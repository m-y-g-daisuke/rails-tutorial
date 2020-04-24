class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user=Use.new(params[:user])
    if @user.save
      #sucsess
    else
      render 'new'
    end
  end

end
