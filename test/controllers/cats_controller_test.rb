class CatsControllerTest < ActionController::TestCase
  def setup
    @user = create(:user, :confirmed)
  end

  test "should get index" do
    sign_in @user

    get :index

    assert_response :success
  end

  test "should not get index if current user = nil" do
    get :index

    assert_redirected_to new_user_session_path
  end
end