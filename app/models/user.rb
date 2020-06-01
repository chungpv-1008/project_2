class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  USER_PARAMS_SIGNUP = %i(email username password password_confirmation).freeze
  USER_PARAMS_LOGIN = %i(email password password_confirmation).freeze

  validates :username, presence: true,
    length: {
      maximum: Settings.user.max_length_username,
      minimum: Settings.user.min_length_username
    },
    format: {with: Settings.user.username_regex}
  validates :email, presence: true,
    length: {maximum: Settings.user.max_length_email},
    format: {with: Settings.user.email_regex},
    uniqueness: {case_sensitive: false}

  before_save :downcase_email

  private

  def downcase_email
    email.downcase!
  end
end
