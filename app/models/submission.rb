class Submission < ApplicationRecord
  belongs_to :challenge_statement
  belongs_to :user
  validates :challenge_statement_id, uniqueness: { scope: :user_id, message: "You've already submitted
             a submission for this challenge statement!" }
  validates :file, presence: true
  has_one_attached :file
  def has_submit?
    return if Submission.exists?(user: user, challenge_statement_id: challenge_statement_id)
  end

end
