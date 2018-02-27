class StyleController < ApplicationController

  get '/styles' do
    @styles = Style.all
    erb :'styles/index'
  end

  get '/styles/:id' do
    @style = Style.find(params[:id])
    erb :'styles/show'
  end
end
