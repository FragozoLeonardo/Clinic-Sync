class AuthenticateUser
  def self.call(email_address, password)
    User.authenticate_by(email_address: email_address, password: password)
  end
end
