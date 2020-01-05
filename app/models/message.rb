class Message
  include ActiveModel::Model
  attr_accessor :name, :user_email, :body
  validates :name, :body, presence: true
  validates :user_email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please enter a valid email address" }
end
