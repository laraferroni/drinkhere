class MasterListItemsController < ApplicationController

  before_filter :authenticate_user!,:only => [:index, :show, :new, :edit, :update, :destroy]


	def index
		@master_list_items = MasterListItem.all
	end

	def show
		@master_list_item = MasterListItem.find(params[:id])
	end

	def edit
		@master_list_item = MasterListItem.find(params[:id])
	end

	def new
	end

	def create
		@master_list_item = MasterListItem.new(master_list_item_params)

    if @master_list_item.save
      render text: "", status: 201
    else
      render json: {user_list_item_params: @master_list_item.errors}, status: 422
    end
	end

	def update 
		@master_list_item = MasterListItem.find(params[:master_list_item][:id])
		if @master_list_item.update(master_list_item_params)
			render text: "", status: 201
		else
			render json: {master_list_item_params: @master_list_item.errors}, status: 422
		end
	end

	def destroy
	end


def master_list_item_params
    return nil if params[:master_list_item].blank?
    params.require(:master_list_item).permit(MasterListItem::PERMITTED_ATTRS)
  end

end
