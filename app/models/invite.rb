class Invite < ActiveRecord::Base
  attr_accessor :prev_invite

  ## Relations
  belongs_to :user
  belongs_to :invitee, class_name: 'User', foreign_key: 'invitee_id'

  ## Validations
  validates :user, presence: true
  validates :email, format: { with:  /\A(^.+@.+$)\z/i }
  validate :check_invitee_exists, :check_last_sent

  ## Callbacks
  after_validation :assign_ref
  after_save :send_mail

  ## Etc.
  def prev_invite
    return unless email && user

    @prev_invite ||= user.invites.where(email: email).last
  end

  private

    def assign_ref
      self.ref = prev_invite ? prev_invite.ref : generate_ref
    end

    def generate_ref
      loop do
        random_code = (9_999_999 * rand).to_i
        break random_code unless Invite.where(ref: random_code).exists?
      end
    end

    def send_mail
      InviteMailer.create(self).deliver_now
    end

    def check_invitee_exists
      return unless User.find_by(email: email)

      errors.add(:email, :user_registred)
    end

    def check_last_sent
      return if !prev_invite || prev_invite.created_at + 1.day < Time.now

      errors.add(:prev_invite, :often)
    end
end
