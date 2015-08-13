require 'bundler'
Bundler.require
require 'bcrypt'

require './config/environment.rb'
require './app/models/user.rb'
require './app/models/like.rb'
require './app/models/post.rb'
require './app/models/comment.rb'

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
   erb :addfood

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

post '/newrecipe' do
  @post= Post.new(:title => params[:title], 
    :ingredients => params[:ingredients],
    :recipe => params[:recipe],
    :image => params[:image])
  @post.save
  if @post.save
  @message= "Your Recipe Has Been Submitted!"
  else
    @error= "Failure. Try Again!"
  end
  erb :index
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
 post '/like' do
  if Like.exists?(:post_id => params[:postid], 
     :user_id => params[:userid])
 else
   @like= Like.new(:user_id => params[:userid], 
     :post_id => params[:postid])
   @like.save
  end
   erb :findfood
  end
post '/mylist' do
  erb :findfood
  end
get '/mylist' do
  erb :mylist
end
post '/recipe' do
  erb :recipe
  end


get '/mylist' do
  erb :mylist
  end
post '/recipe' do
  @recipe = Recipe.new
  @recipe.message = params[:message]
  @recipe.user_id = params[:user]
  @recipe.save
  
  erb :mylist
end
  
end
  

  
  
  
  
