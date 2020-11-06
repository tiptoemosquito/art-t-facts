class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do 
        # binding.pry
        @user = User.new(
        name: params[:name], 
        email: params[:email], 
        username: params[:username], 
        password: params[:password]
        )

        if @user
            @user.save
            session[:user_id] = @user.id
            redirect '/categories'
        else 
            redirect '/signup'
        end
    end


end