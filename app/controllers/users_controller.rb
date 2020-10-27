class UsersController < ApplicationController

    get '/' do 
        erb :
    end

    get 'signup' do
        if !logged_in?
            erb :'user/create_user', locals: {mesage: "New? Sign Up now! Then sign in once completed!"}
        else 
            redirect to '/'
        end
    end

    post 'signup' do 
        if params[:username] == "" || params[:email] == || params[:password] == ""
            redirect to '/signup'
        else 
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:passowrd])
            @user.save
            session[:user_id] = @user.id 
            redirect to '/'
        end
    end

    get 'login' do
        if !logged_in?
            erb :'user/login'
        else
            redirect to '/'
        end 
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.autheniticate(params[:password])
            session[:user_id] = user.user_id
            redirect to '/'
        else 
            redirect to '/signup'
        end
    end


end