class BreweryController < ApplicationController

  get '/breweries' do
    @breweries = Brewery.all
    erb :'breweries/index'
  end

  get '/breweries/:id' do
    @brewery = Brewery.find(params[:id])
    erb :'breweries/show'
  end

end
