class SessionsController < ApplicationController

  def new
  end

  def create
    user=Use.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #action
    else
      #show error message
    render 'new'
    end
  end

  def destroy
  end

end
