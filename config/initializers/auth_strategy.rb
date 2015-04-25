# Custom Warden strategy for devise. Trinity Core auth rule (SHA1 hash username:password)
Warden::Strategies.add(:auth_strategy) do 
  def valid?
	if params['email'].nil? || params['password'].nil?
		false
	else
		true
	end
  end
  
  def authenticate!
  		
  		mail = params['email'].downcase
  		password = params['password']
  		hash = Digest::SHA1.hexdigest("#{mail}:#{password}")
      	user = Account.find_by(username: mail)
      	if user && user.sha_pass_hash == hash
      		success!(user)
      	else
      		fail!("Invalid username or password")
      	end
  end   
end