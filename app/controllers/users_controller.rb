class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do 
        @user = User.create(name: params[:name], 
        email: params[:email], 
        username: params[:username], 
        password: params[:password])

        if @user 
            session[:user_id] = @user.id
            redirect '/categories'
        else 
            redirect '/login'
        end
    end

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/categories'
        else
          redirect '/signup'
        end
    end

    get '/logout' do
        session.destroy
        redirect to '/login'
    end 

end