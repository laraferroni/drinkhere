class UserListItemsController < ApplicationController

  before_filter :authenticate_user!,:only => [:index, :show, :new, :edit, :update, :destroy, :queue]

	def index
	end

	def show
	end

	def edit
	end

	def new
	end

	def create
		@user_item = UserListItem.new(user_list_item_params)
		@user_item.user = current_user
		@user_item.date_completed = Time.now()
		@user_item.approval_status = 0
		@user_item.completed = true

    if @user_item.save
      render text: "", status: 201
    else
      render json: {user_list_item_params: @user_item.errors}, status: 422
    end
	end

	def update 
		logger.debug(params[:user_list_item])
		uli = UserListItem.find(params[:user_list_item][:id])
		if uli.update(user_list_item_params)
			render text: "", status: 201
		else
			render json: {user_list_item_params: @user_item.errors}, status: 422
		end
	end

	def destroy
	end

	def history
		if current_user.is_approver
			@all_items = UserListItem.all
		else
			redirect_to main_app.root_path
		end
	end


	def queue
		if current_user.is_approver
			@queued_items = UserListItem.where(approval_status: Enum::PENDING)
		else
			redirect_to main_app.root_path
		end
	end

	def approve_all
		if current_user.is_approver
			@queued_items = UserListItem.where(approval_status: Enum::PENDING)
			@queued_items.each do |item|
				item.approval_status = Enum::APPROVED
				item.approved_by = current_user
				item.save
			end
			redirect_to "/queue"
		else
			redirect_to main_app.root_path
		end
	end

def user_list_item_params
    return nil if params[:user_list_item].blank?
    params.require(:user_list_item).permit(UserListItem::PERMITTED_ATTRS)
  end

end
