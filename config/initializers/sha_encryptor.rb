require 'digest/sha1'
# Custom password encryption according to Trinity Core rules
module Devise
  module Encryptable
    module Encryptors
      class CustomSha < Base

        def self.digest(password, stretches, salt, pepper)
        	Digest::SHA1.hexdigest("#{salt.downcase}:#{password}")
        end

      end
    end
  end
end