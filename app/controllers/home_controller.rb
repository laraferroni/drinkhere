class HomeController < ApplicationController

  :use_growlyflash

  def index
    
    @site_achievements = Achievement.all
  	if current_user.present?
  		@user = current_user
      if params[:id].present?
        @achievement = Achievement.find(params[:id])
      else
        @achievements = Achievement.all
        render "/achievements/index"
      end

       
  	else
  		render :welcome
  	end

  end

end
