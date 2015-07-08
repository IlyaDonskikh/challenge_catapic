class RegistrationsController < Devise::RegistrationsController
  after_filter :assing_invitee

  protected

    def assing_invitee
      return unless resource.persisted?

      invite = Invite.order('created_at DESC')
               .where(invitee_id: nil, ref: session[:ref])
               .first

      invite && invite.join_with_invitee!(resource)
    end
end
