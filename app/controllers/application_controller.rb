require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts' do
    @post = Post
    erb :index
  end

  post '/posts' do
    Post.create(params)
    @post = Post
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id/edit' do

    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do

    post = Post.find(params[:id])
    post.content=(params[:content])
    post.name=(params[:name])
    post.save
    @post = post
    erb :show
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  delete '/posts/:id/delete' do

    post = Post.find(params[:id])
    @name = post.name
    post.destroy
    erb :delete
  end





end
