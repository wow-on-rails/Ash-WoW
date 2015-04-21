class Character < ActiveRecord::Base
	establish_connection("characters_db").connection

end