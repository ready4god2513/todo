class AuthorizationException < StandardError

  def message
    'Unauthorized Request: You are not authorized to view this resource'
  end

end