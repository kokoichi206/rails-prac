require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    # フラッシュメッセージが表示されること！
    assert_not flash.empty?
    get root_path
    # 移動先のページでフラッシュメッセージが残っていないこと！
    assert flash.empty?
  end
end
