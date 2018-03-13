require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index, layout: false
  end

  get '/signup' do
    if logged_in?
      redirect '/beers'
    else
      erb :'users/create', layout: false
    end
  end

  post '/signup' do
    if User.find_by(username: params[:user][:username])
      flash[:message] = "That Username already exists"
      redirect '/signup'
    elsif !params[:user][:username].empty? && !params[:user][:password].empty?
      user = User.create(params[:user])
      session[:user_id] = user.id
      redirect '/beers'
    else
      flash[:message] = "Username and password must be filled out"
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/beers'
    else
      erb :'users/login', layout: false
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/beers'
    else
      flash[:message] = "Invalid Username/Password"
      redirect '/login'
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  get '/logout' do
    if logged_in?
      session.clear
    end
    redirect '/login'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by_id(session[:user_id])
    end
  end

end
