class HomeController < ApplicationController
  def index
  	if current_user.present?
  		@user = current_user
  		@list = MasterList.first
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
