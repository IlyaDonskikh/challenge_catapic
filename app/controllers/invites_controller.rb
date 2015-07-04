class InvitesController < ApplicationController
  before_filter :check_current_user

  def new
    @invite = Invite.new
  end

  def create
    @invite = current_user.invites.new(invite_params)

    if @invite.save
      redirect_to cats_path, notice: 'Invite was sent'
    else
      render :new
    end
  end

  private

    def invite_params
      params.require(:invite).permit(:email)
    end
end
