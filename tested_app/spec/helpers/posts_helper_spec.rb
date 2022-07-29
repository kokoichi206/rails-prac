require 'rails_helper'
include PostsHelper

RSpec.describe PostsHelper, type: :helper do
  it 'assigns a user to a post' do
    creator = User.first_or_create!(email: 'john.doe@example.com', password: 'password', password_confirmation: 'password')
    @post = Post.new(
      title: 'MyTitle',
      body: 'MyBody',
      views: 1,
    )

    returned_post = assign_post_creator(@post, creator)

    expect(returned_post.user).to be(creator)
  end
end
