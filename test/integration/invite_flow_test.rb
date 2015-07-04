require 'test_helper'

class InviteFlowsTest < ActionDispatch::IntegrationTest
  test "use invite, sign up and assign invite" do
    user = create(:user_with_invites, :confirmed)
    new_user_attrs = attributes_for(:user)
    invite = user.invites.last

    open_session do |sess|
      ## open with ref params
      sess.get new_user_session_path, ref: invite.ref

      assert_equal invite.ref, sess.session[:ref]

      ## sign up
      sess.post user_registration_path, user: new_user_attrs

      user = User.find_by(email: new_user_attrs[:email])
      invite = Invite.find_by(invitee_id: user.id)

      assert user
      assert invite
    end
  end
end