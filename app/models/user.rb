class User < ApplicationRecord

  has_many :challenge_statements
  has_many :submissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_acceptance_of :rules_and_regulations, :allow_nil => false, :accept => true, :on => :create
  def is_admin?
    admin
  end

end
