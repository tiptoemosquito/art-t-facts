class SuppliesController < ApplicationController

    get '/categories/:category_id/supplies/new' do
        @category_id = params[:category_id].to_i
        erb :'supplies/new'
    end

    post '/categories/:category_id/supplies/new' do
        current_user.categories
        category.supplies.create

        supply = category.create(
            medium: params[:medium],
            tools: params[:medium],
            category_id: params[:category_id].to_i
        )
        redirect '/categories'
    end

    


end