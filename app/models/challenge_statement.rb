class ChallengeStatement < ApplicationRecord
  default_scope -> { order(created_at: :asc) }
  belongs_to :user
  has_many :submissions, dependent: :destroy
  validates :title, :partner_name, presence: true
  validates :description, presence: true
  has_one_attached :zip

end
