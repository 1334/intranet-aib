class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def self.authenticate(name,password)
    if UserAuthentication.authenticate name, password
      find_by_name(name) || create(name: name, email: "#{name}@aib.cat")
    end
  end
end
