class ToppagesController < ApplicationController


  def index
    if logged_in?
      @posts = Post.all.order(id: :desc)

    end
  end

  
end

