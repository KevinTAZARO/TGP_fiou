class UsersController < ApplicationController
    
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
        @users = User.all
    end
    
    def create
        @users = User.all
    
        @users = User.new(
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          password: params[:password],
          age: params[:age],
          city_id: params[:city].to_i,
          description: params[:description]
        )
        
        if @users.save
          session[:user_id] = @users.id
          redirect_to root_path
        else
          render :new
        end
    end
    
end