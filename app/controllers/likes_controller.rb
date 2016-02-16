class LikesController < ApplicationController
  before_action :require_login
  def create
    Like.create(user: current_user, secret: Secret.find(params[:secret_id]))
    redirect_to :back
  end
  def destroy
    @like = Like.where("user_id = ? AND secret_id = ?",session[:user_id],params['id'])
    @like[0].destroy
    redirect_to :back
  end
end
