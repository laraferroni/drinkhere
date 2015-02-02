class Account < ActiveRecord::Base
  has_one :setting
  

  after_save :create_settings

  def create_settings
  	ActsAsTenant.current_tenant = self

  	logger.debug("create settings")
  	logger.debug(self.id)
  	s = Setting.where(account_id: self.id).first
  	if s.nil?
  		s = Setting.new
	  	s.account_id = self.id
  		s.save
	  end
  end

  	

end