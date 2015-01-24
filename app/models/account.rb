class Account < ActiveRecord::Base
  has_one :setting
  
end