class AuthenticationException < StandardError

  def message
    'Authentication Error: Please log in'
  end

end