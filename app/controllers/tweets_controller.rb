class TweetsController < ApplicationController

  def index
    if current_user
      @tweets = Tweet.order(created_at: :desc)
      @tweet = Tweet.new
    else
      redirect_to new_session_path
    end
  end

  def create
    tweet = Tweet.new(tweet_params)
      if tweet.save
        flash[:notice] = "Your tweet was posted!"
        redirect_to tweets_path
      else
        flash[:notice] = "Your tweet must be between 5 and 140 characters"
        @tweet = Tweet.new
        @tweets = Tweet.all
        render "tweets/index"
      end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if authorized?(tweet)
      tweet.destroy
      flash[:notice] = "Your tweet was successfully deleted."
      redirect_to tweets_path
    else
      redirect_to new_session_path
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content).merge(poster_id: current_user.id)
  end
end
