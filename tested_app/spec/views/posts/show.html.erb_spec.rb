require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  current_user = User.first_or_create!(email: 'john.doe@example.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    @post = assign(:post, Post.create!(
      title: "Title",
      body: "MyText",
      user: current_user,
      views: 212
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/212/)
  end
end
