class HomeController < ApplicationController



  def index

    @site_achievements = Achievement.all
  	if current_user.present?
  		@user = current_user
      if params[:id].present?
        @task = Task.find(params[:id])
        @list = MasterList.find(@task.master_list_id)
      else
        if @user_achievements.present?
          @task = @user_achievements.tasks.first
      		@list = MasterList.find(@task.master_list_id)
        else
          @achievements = Achievement.all
          render "/achievements/index"
        end
      end
      if @list.nil?
        @master_list = []
        @userlist = []
        @tasks = []
      else
    		@master_list = MasterListItem.available.where("master_list_id = ?", @list.id).order("full_name ASC")
        @userlist = UserListItem.where("user_id = ? AND master_list_id = ?", @user.id, @list.id)
        @tasks = Task.where("master_list_id = ?", @list.id)
      end
       
  	else
  		render :welcome
  	end

  end

end
