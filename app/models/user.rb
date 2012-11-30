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
    user = "#{ENV['COMPANY_NAME']}\\#{name}"
    ldap = Net::LDAP.new
    ldap.host = "#{ENV['LDAP_ADDRESS']}"
    ldap.port = "#{ENV['LDAP_PORT']}"
    ldap.encryption(:simple_tls)
    ldap.auth(user,password)
    if ldap.bind
      User.find_by_name(name) || User.create(name: name, email: "#{name}@aib.cat")
    else
      false
    end
  end
end
