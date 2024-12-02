class User < ApplicationRecord
  has_many :reviews
  has_many :offers 
  has_one_attached :photo
  has_many :group_members, dependent: :destroy
  has_many :votes, dependent: :destroy

  #added for invitations & friendship
  has_many :invitations
  has_many :invitations_sent, class_name: 'Invitation', foreign_key: "user_id" 
  has_many :invitations_received, class_name: 'Invitation', foreign_key: "friend_id" 

  has_many :pending_invitations, -> { where confirmed: false}, class_name: 'Invitation', foreign_key: "friend_id"
  #has_many :unconfirmed_sent_invitations, { confirmed: false }, class_name: 'Invitation', foreign_key: "user_id"

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 5..25 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  def accept_invitation(user)
    if !pending_invitations.empty?
      pending_invitations.where(user_id: user.id).first.confirmed = true
      pending_invitations.where(user_id: user.id).first.save!
    end
  end

end
