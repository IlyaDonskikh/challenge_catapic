require 'test_helper'

class InviteMailerTest < ActionMailer::TestCase

  test "invite include link with ref" do
    user = create(:user_with_invites)
    invite = user.invites.last

    email = InviteMailer.create(invite).deliver_now

    assert email.body.to_s.match(invite.ref)
  end
end
