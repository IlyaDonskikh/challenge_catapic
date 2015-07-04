require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  def setup
    @user = create(:user, :confirmed)
    @email = 'invitetest@mail.com'
  end

  test 'assign ref' do
    invite = @user.invites.create(email: @email)

    assert invite.ref
  end

  test 'send mail with ref' do
    @user.invites.create(email: @email)

    invite_email = ActionMailer::Base.deliveries.last

    assert invite_email
  end

  test 'should not create if sent by another invite' do
    @user.invites.create(email: @email)

    invite = @user.invites.create(email: @email)

    assert invite.new_record?
  end

  test 'should create if sent by another invite' do
    @user.invites.create(email: @email)

    travel 1.day + 1.second do
      invite = @user.invites.create(email: @email)

      assert invite.id
    end
  end
end
