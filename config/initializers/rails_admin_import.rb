RailsAdminImport.config do |config| 
  config.model MasterListItem do
    excluded_fields do
      [:user_list_item, :user, :task]
    end
    label :name

  end
end