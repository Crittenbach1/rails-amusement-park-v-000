class AttractionsController < ApplicationController
   before_action :require_login

   def index
     @attractions = Attraction.all
     @user = User.find(session[:user_id])
   end

   def new
     @attraction = Attraction.new
   end

   def create
     @attraction = Attraction.create(attraction_params)

     redirect_to attraction_path(@attraction)
   end

   def show
     @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
   end


   def edit
     @attraction = Attraction.find(params[:id])
   end

   def update
     @attraction = Attraction.find(params[:id])
     @attraction.update(attraction_params)
     redirect_to attraction_path(@attraction)
   end

   def attraction_params
     params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
   end

   def require_login
     if session[:user_id].nil?
       redirect_to root_path
     end
   end
end
