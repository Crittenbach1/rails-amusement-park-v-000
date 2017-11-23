class RidesController < ApplicationController
   before_action :require_login

   def create
     @user = User.find(session[:user_id])
     @ride = Ride.new(attraction_id: params[:id], user_id: session[:user_id])
     @ride = @ride.take_ride
     session[:message] = @ride
     redirect_to user_path(@user)
   end

   def require_login
     if session[:user_id].nil?
       redirect_to root_path
     end
   end
end
