class Authentication

  attr_accessor :user
  attr_reader :params

  def initialize(parameters)
    @params = default_params
      .merge(parameters || Hash.new)
      .with_indifferent_access
  end

  def login
    @user = User.where(email: params[:email]).first.try(:authenticate, params[:password])
  end

  private

  def default_params
    { email: nil,  password: nil }
  end

end