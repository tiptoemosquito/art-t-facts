class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do 
        @user = User.create(
        name: params[:name], 
        email: params[:email], 
        username: params[:username], 
        password: params[:password]
        )

        if @user 
            session[:user_id] = @user.id
            redirect '/categories'
        else 
            redirect '/login'
        end
    end


end