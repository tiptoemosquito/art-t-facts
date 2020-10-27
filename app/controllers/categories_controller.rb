class CategoriesController < ApplicationController

    get '/categories' do
        @categories = current_user
        erb :'categories/index'
    end

    post '/logout' do
        redirect '/users'
    end
end