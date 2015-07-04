class InviteMailer < ApplicationMailer
  def create(invite)
    @invite = invite

    mail to: @invite.email, subject: 'Invite'
  end
end
