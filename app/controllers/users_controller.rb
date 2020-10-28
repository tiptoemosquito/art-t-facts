class UsersController < ApplicationController

    get '/users/signup' do
        erb :'/users/signup'
    end

    post '/users/signup' do 
        @user = User.create(name: params[:name], 
        email: params[:email], 
        username: params[:username], 
        password: params[:password])

        if @user 
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else 
            redirect '/users/signup'
        end
    end

    get '/users/login' do
        erb :'/users/login'
    end

    post '/users/login' do
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect "/users/#{@user.id}"
        else
          redirect '/users/login'
        end
    end

    post '/logout' do
        session.destroy
        redirect '/users/login'
    end 

end