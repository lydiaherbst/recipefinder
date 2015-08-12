require 'bundler'
Bundler.require
require 'bcrypt'

require './config/environment.rb'
require './app/models/user.rb'

class ApplicationController < Sinatra::Base
configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  
      enable :sessions
  set :session_secret, 'recipefinder'
   end 
  
  get '/' do
    erb :index
  end
    get '/findfood' do
      erb :findfood
  end

 get '/addfood' do
    
  end

  post '/login' do
    @user = User.find_by username: (params[:username])

    if @user
    #  if @user.password == params[:password]
      session[:user_id] = @user
   #   end
    end

    erb :index
  end
get '/signup' do
  erb :signup
  end

 post '/signup' do
   @user = User.new(:password => params[:password], :password_confirmation => params[:password_confirmation])
   @user.name = params[:name]
   @user.username = params[:username]
   @user.email = params[:email]
   
   @user.save 

   if @user
     session[:user_id] = @user
    end

    erb :index
  end

end
  

  
  
  
  
