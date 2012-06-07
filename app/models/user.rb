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
  
  def self.searchAD
    ldap = Net::LDAP.new
    ldap.host = "#{APP_CONFIG['ldap']['address']}"
    ldap.port = "#{APP_CONFIG['ldap']['port']}"
    ldap.encryption(:simple_tls)
    username = "isolano"
    user = "#{APP_CONFIG['company_name']}\\#{name}"
    password = "rozz1334"

    ldap.auth  user, password
    
    ldap.bind

    # treebase = "ou=SBSUsers,ou=Users,ou=MyBusiness,dc=AIBMAT,dc=local"
    # filter = Net::LDAP::Filter.eq("uid", "*")
    # attrs = []
    # ldap.search(:base => treebase, :filter => filter, :attributes => attrs,
    #             :return_result => true) do |entry|
    #   puts "DN: #{entry.dn}"
    #   entry.each do |attr, values|
    #     puts ".......#{attr}:"
    #     values.each do |value|
    #       puts "          #{value}"
    #     end
    #   end
    # end

    # is_authorized = ldap.bind

    # filter = Net::LDAP::Filter.eq("mail", "*i*")
    # attrs = []
    
    # ldap.search( :base => "ou=SBSUsers,ou=Users,ou=MyBusiness,dc=AIBMAT,dc=local", :attributes => attrs, :filter => filter, :return_result => true  ) do |entry|
    #   puts entry.dn
    #   entry.attribute_names.each do |n|
    #     puts "#{n} = #{entry[n]}"

    #   end
    # end
  end

  def self.user(name)
    user = User.find_by_name(name) || User.create(name: name, email: "#{name}@aib.cat")
  end
end
