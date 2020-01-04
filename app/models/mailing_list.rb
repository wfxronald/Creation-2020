class MailingList < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { message: "is already in the subscription list"}
end
