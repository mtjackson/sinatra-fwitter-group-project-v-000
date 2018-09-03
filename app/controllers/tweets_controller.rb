class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect to '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/create_tweet'
    else
      redirect to '/login'
    end
  end

  post '/tweets/new' do
    @user = User.find(session[:user_id])
    if params[:content]
      @tweet = Tweet.create(:content => params[:content], :user_id => @user.id)
      # binding.pry
      redirect to '/tweets'
    else
      redirect to '/tweets/new'
    end
  end


end
