class User < ApplicationRecord
  has_many :reviews
  has_many :offers 
  has_one_attached :photo
  has_many :group_members, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 5..25 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable
end
