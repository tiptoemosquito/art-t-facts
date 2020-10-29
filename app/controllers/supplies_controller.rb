class SuppliesController < ApplicationController

    get '/supplies' do
        if logged_in?
            @supplies = current_user.supplies
        erb :'/supplies/show'
        else
            redirect '/login'
        end
    end
#create
    get '/supplies/new' do
        @category_id = params[:category_id].to_i
        erb :'supplies/new'
    end

    get '/categories/:category_id/supplies/new' do
        current_user.categories
        category.supplies.create

        supply = category.create(
            medium: params[:medium],
            tools: params[:medium]
        )
        redirect '/categories'
    end

    post '/supplies' do
        if logged_in?
        else
            redirect '/login'
        end
    end
#edit
    get '/supplies/:id/edit' do
        if logged_in?
            @supply = current_user.supplies.find_by(id: params[:id])
            if @supply
            erb :'supplies/edit'
            else  
                redirect '/categories'
            end 
        else  
            redirect '/login'
        end
    end

    patch '/supplies/:id' do
        if logged_in?
            @supply = current_user.supplies.find_by(id: params[:id])
            if @supply 
                if @supply.update(medium: params[:medium], tools: params[:tools])
                    redirect '/categories'
                else 
                    redirect "/supplies/#{@supply.id}/edit"
                end
            else
                redirect '/categories'
            end
        else
            redirect '/login'
        end
    end
#delete
    delete '/supplies/:id/delete' do
        if logged_in? 
            @supply = current_user.supplies.find_by(id: params[:id])
            if @supply 
                @supply.destroy 
                redirect '/categories'
            else  
                redirect '/categories'
            end 
        else  
            redirect '/login'
        end
    end 



    


end