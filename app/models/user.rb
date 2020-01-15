class User < ApplicationRecord

  has_many :challenge_statements
  has_many :submissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :validatable
  validates :rules_and_regulations, acceptance: true
  validates :name, :faculty, :year, :contact_number, presence: true
  validates :nusnet, length: {is: 8}
  def is_admin?
    admin
  end

  def has_joined_challenge?(id)
    id.in?(joined_challenge_statement)
  end

  def has_submit_for_joined_challenge?(submitted,userd)
    submitted.all.where(:user_id => userd.id).exists?
  end

end
