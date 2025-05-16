class AuthenticateUser
  def self.call(email, password)
    User.authenticate_by(email: email, password: password)
  end
end
