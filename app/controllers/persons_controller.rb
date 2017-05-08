class PersonsController < ApplicationController
  def profile
  end

  def show
	  @user = params[:id].nil? ? current_user : User.find(params[:id])
	end
end
