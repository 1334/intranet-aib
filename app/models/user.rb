class User < ActiveRecord::Base
  has_many :timesheets
  attr_accessible :email, :name, :password
  
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def self.authenticate(name,password)
    return if password.blank?
    user = "#{APP_CONFIG['company_name']}\\#{name}"
    ldap = Net::LDAP.new
    ldap.host = "#{APP_CONFIG['ldap']['address']}"
    ldap.port = "#{APP_CONFIG['ldap']['port']}"
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
