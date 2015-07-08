class RegistrationsController < Devise::RegistrationsController
  after_filter :assing_invite

  protected

    def assing_invite
      return unless resource.persisted?

      invite = Invite.order('created_at DESC')
               .where(invitee_id: nil, ref: session[:ref])
               .first

      invite && invite.join_with_invitee!(resource)
    end
end
