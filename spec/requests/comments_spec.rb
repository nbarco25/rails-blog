require 'rails_helper'

RSpec.describe 'Comments', type: :controller do
  let(:current_user) do
    User.create(
      email: 'ang@hotmail.com',
      password: 'qwerty12345'
    )
  end

  before do
    sign_in current_user
  end

  let(:valid_article_params) do
    {
      title: 'Hello',
      body: 'This is a first article',
      status: 'public'
    }
  end

  let(:valid_comment_params) do
    {
      body: 'Cooool, great article',
      status: 'public'
    }
  end

  describe 'POST #create' do
    context 'valid params and authenticated user' do
      it 'creates a new comment' do
        article = current_user.articles.create(valid_article_params)
        article.save
        comment = article.comments.create(valid_comment_params)
        comment.id = '1'
        comment.user_id = current_user.id
        comment.commenter = current_user.email
        expect(response).to be_successful
      end
    end
  end
end
