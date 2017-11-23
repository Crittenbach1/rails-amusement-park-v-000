class UsersController < ApplicationController
   before_action :require_login, except: [:new, :create]

   def new
     @user = User.new
   end

   def create
     #binding.pry
     @user = User.new(user_params)
     if @user
       @user.save
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       render :new
     end
   end

   def show
    # binding.pry
     @user = User.find(session[:user_id])
   end

   def user_params
     params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
   end

   def require_login
     if session[:user_id].nil?
       redirect_to root_path
     end
   end
end
