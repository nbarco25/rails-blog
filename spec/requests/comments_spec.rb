require 'rails_helper'

RSpec.describe 'Comments', type: :controller do
  let(:user) do
    User.create(
      email: 'ang@hotmail.com',
      password: 'qwerty12345',
    )
  end

  before do
    sign_in user
  end

  let(:article) do
    Article.create(
      title: 'Machine learning',
      body: 'Machine learning is a interesting ...',
      status: 'public'
    )
  end

  let(:valid_params) do
    {
      body: 'Cooool, great article',
      status: 'public',
    }
  end

  describe 'POST #create' do
    context 'valid params' do
      it 'creates a new comment' do
        comment_params = {
          comment: {
            body: valid_params[:body],
            status: valid_params[:status],
          }
      }

      end
    end

  end


end
