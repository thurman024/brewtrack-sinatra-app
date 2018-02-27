# require 'rack-flash'

class BeerController < ApplicationController

  get '/beers' do
    @beers = Beer.all
    erb :'beers/index'
  end

  get '/beers/new' do
    if logged_in?
      erb :'beers/create'
    else
      flash[:message] = "You must be logged in to create a beer"
      redirect '/login'
    end
  end

  post '/beers' do
    binding.pry
    if params[:beer][:name].empty?
      flash[:message] = "Name field can not be empty"
      redirect '/beers/new'
    else
      if !!params[:beer][:style_id] == !params[:new_style].empty?
        flash[:message] = "Error - exactly one style input needed. Select existing style OR create a new one"
        redirect '/beers/new'
      elsif !params[:new_style].empty?
        style = Style.create(name: params[:new_style])
        params[:beer][:style_id] = style.id
      end
      if !!params[:beer][:brewery_id] == !params[:new_brewery].empty?
        flash[:message] = "Error - exactly one brewery input needed. Select existing brewery OR create a new one"
        redirect '/beers/new'
      elsif !params[:new_brewery].empty?
        brewery = Brewery.create(name: params[:new_brewery], location: params[:location])
        params[:beer][:brewery_id] = brewery.id
      end
      params[:beer][:user_id] = current_user.id
      Beer.create(params[:beer])
    end
    redirect "/beers/#{Beer.last.id}"
  end

  get '/beers/:id' do
    @beer = Beer.find(params[:id])
    @user = current_user
    erb :'beers/show'
  end

  get '/beers/:id/edit' do
    @beer = Beer.find(params[:id])
    if @beer.user_id == current_user.id
      erb :'beers/edit'
    else
      flash[:message] = "You are only allowed to edit a beer created by you"
      redirect to "/beers/#{@beer.id}"
    end
  end

  post '/beers/:id' do
    @beer = Beer.find(params[:id])
    if !params[:new_style].empty?
      style = Style.create(name: params[:new_style])
      params[:beer][:style_id] = style.id
    end
    if !params[:new_brewery].empty?
      brewery = Brewery.create(name: params[:new_brewery], location: params[:location])
      params[:beer][:brewery_id] = brewery.id
    end
    @beer.update(params["beer"])
    redirect "/beers/#{@beer.id}"
  end

  post '/beers/:id/delete' do
    if logged_in?
      @beer = Beer.find(params[:id])
      @beer.delete
    end
    flash[:message] = "Beer successfully deleted"
    redirect '/beers'
  end
end
