class Access < ActiveRecord::Base
	belongs_to :account
	self.table_name = "account_access"
end
