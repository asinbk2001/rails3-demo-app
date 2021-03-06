module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.email]
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def sign_in?
    !current_user.nil?
  end

  private

  def user_from_remember_token
    User.authenticate_with_email(*remember_token)
  end

  def remember_token
    cookies.signed[:remember_token] || [nil, nil]
  end
end
