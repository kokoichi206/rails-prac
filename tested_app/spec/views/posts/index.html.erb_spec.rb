require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  current_user = User.first_or_create!(email: 'john.doe@example.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Title",
        body: "MyText",
        user: current_user,
        views: 141
      ),
      Post.create!(
        title: "Title",
        body: "MyText",
        user: current_user,
        views: 22
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "div>p", text: "Show this post".to_s, count: 2
  end
end
