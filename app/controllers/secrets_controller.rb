class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
    @secrets = Secret.all
  end
  def create
    @secret = Secret.new(secret_params)
    unless @secret.save
      flash[:error]
    end
    redirect_to current_user
  end
  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    redirect_to current_user
  end
  private
    def secret_params
      params.require(:secret).permit(:content).merge(user: current_user)
    end
end
