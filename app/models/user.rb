class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Relations
  has_many :invites

  ## Etc.
  def assign_invite!(ref)
    invite = Invite.where(invitee_id: nil, ref: ref).last

    return unless invite

    invite.update(invitee_id: id)
  end
end
