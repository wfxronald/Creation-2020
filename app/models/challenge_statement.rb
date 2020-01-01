class ChallengeStatement < ApplicationRecord
  belongs_to :user
  has_many :submissions, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true

end
