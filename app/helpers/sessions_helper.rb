module SessionsHelper
  def email? email
    Settings.user.email_regex === email
  end
end
