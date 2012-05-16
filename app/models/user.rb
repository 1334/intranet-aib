class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def self.authenticate(name,password)
    return if password.blank?
    user = "AIBMAT\\#{name}"
    ldap = Net::LDAP.new
    ldap.host = "192.168.15.2"
    ldap.port = 636
    ldap.encryption(:simple_tls)
    ldap.auth(user,password)
    if ldap.bind
      self.user(name)
    else
      false
    end
  end

  def self.user(name)
    user = User.find_by_name(name) || User.create(name: name, email: "#{name}@aib.cat")
  end
end
