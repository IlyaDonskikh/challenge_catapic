class RegistrationsController < Devise::RegistrationsController
  after_filter :add_account

  protected

    def add_account
      return unless resource.persisted?

      resource.assign_invite!(session[:ref])
    end
end
