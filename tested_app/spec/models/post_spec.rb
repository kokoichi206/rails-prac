require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'john.doe@example.com', password: 'password', password_confirmation: 'password')

  it 'has a title' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = "Has a title"
    expect(post).to be_valid
  end

  it 'has a body' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = "Has a body"
    expect(post).to be_valid
  end

  it 'has a title at least 2 characters long' do
    post = Post.new(
      title: 'I',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.title = "I am"
    expect(post).to be_valid
  end

  it 'has a body between 5 and 100 characters' do
    post = Post.new(
      title: 'A valid title',
      body: 'min',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = "body has at least 5 letters. body has at least 5 letters. body has at least 5 letters. but max 100.."
    expect(post).to be_valid

    post.body = post.body + "1"
    expect(post).to_not be_valid
  end

  it 'has numerical views' do
    post = Post.new(
      title: 'A valid title',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post.views).to be_a(Integer)
  end
end
