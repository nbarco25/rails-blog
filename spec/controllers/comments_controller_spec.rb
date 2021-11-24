require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:current_user) { create(:user) }
  let(:article) { create(:article) }

  before(:each) do
    sign_in current_user
  end

  describe '#create' do
    let(:comment) { create(:comment) }
    let(:params) do
      {
        'comment' => { 'body' => 'hola', 'status' => 'public' }, 'article_id' => article.id
      }
    end
    it 'when create comment' do
      post :create, params: params
      expect(Comment.count).to eq(1)
      expect(response).to have_http_status(302)
    end
  end

  describe '#destroy' do
    let(:comment) { create(:comment) }
    it 'destroys a comment' do
      delete_params = { 'article_id' => '2', 'id' => comment.id }
      delete :destroy, params: delete_params
      expect(Comment.count).to eq(0)
    end
  end
end
