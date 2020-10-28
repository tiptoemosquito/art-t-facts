require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, '29gmsus7jdlw0w/-mjifh65djiojfpu475oijdo' 
  end

  get "/" do #root route
    erb :welcome
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end

end
