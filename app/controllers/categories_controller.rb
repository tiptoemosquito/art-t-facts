class CategoriesController < ApplicationController

    get '/categories' do
        binding.pry
        @categories = current_user.categories
        erb :'categories/index'
    end

    post '/logout' do
        redirect '/users'
    end
end