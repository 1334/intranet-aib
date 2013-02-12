class UserAuthentication
  def self.authenticate(name,password)
    return false if password.blank?
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
