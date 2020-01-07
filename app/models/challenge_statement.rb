class ChallengeStatement < ApplicationRecord
  belongs_to :user
  has_many :submissions, dependent: :destroy
  validates :title, presence: true
  validates :description, :zip, presence: true
  has_one_attached :zip

end
