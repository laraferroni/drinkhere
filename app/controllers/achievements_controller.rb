class AchievementsController < ApplicationController

	def index
		@achievements = Achievement.all
	end

	def show
		@achievement = Achievement.find(params[:id])
	end

	def edit
		@achievement = Achievement.find(params[:id])
	end

	def new
	end

	def create
		@achievement = Achievement.new(achievement_params)

    if @achievement.save
      format.html { redirect_to @achievement, notice: 'Achievement was successfully created.' }
      format.json { render action: 'show', status: :created, location: @achievement }
    else
      render json: {achievement_params: @achievement.errors}, status: 422
    end
	end

	def update 
		@achievement = Achievement.find(params[:achievement][:id])
		if @achievement.update(achievement_params)
      format.html { redirect_to @achievement, notice: 'Achievement was successfully updated.' }
      format.json { render action: 'show', status: :created, location: @achievement }
		else
			render json: {achievement_params: @achievement.errors}, status: 422
		end
	end

	def destroy
	end


def achievement_params
    return nil if params[:achievement].blank?
    params.require(:achievement).permit(Achievement::PERMITTED_ATTRS)
  end

end
