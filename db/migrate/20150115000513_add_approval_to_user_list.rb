class AddApprovalToUserList < ActiveRecord::Migration
  def change
  	add_column :user_list_items, :approval_status, :integer
  	add_column :achievements, :company_id, :integer
  end
end
