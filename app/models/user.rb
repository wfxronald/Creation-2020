class User < ApplicationRecord

  has_many :challenge_statements
  has_many :submissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates :rules_and_regulations, acceptance: true
  def is_admin?
    admin
  end

end
