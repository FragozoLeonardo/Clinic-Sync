class AuthorizeUser
  def self.call(user, user_type)
  user.is_a?(user_type)
  end
end
