class Invite < ActiveRecord::Base
  ## Relations
  belongs_to :user
  belongs_to :invitee, class_name: 'User', foreign_key: 'invitee_id'

  ## Validations
  validates :user, presence: true
  validates :email, format: { with:  /\A(^.+@.+$)\z/i }

  ## Etc.
  def ref
    "#{created_at.strftime('%d%m%y%H%M')}#{id}"
  end
end
