require 'rails_helper'

RSpec.describe 'Comments', type: :controller do
  describe '#create' do
    let(:current_user) { FactoryBot.create(:user) }
    let(:article) { FactoryBot.create(:article, user: current_user) }
    let(:comment) { FactoryBot.create(:comment, user: current_user, article: article) }

    before do
      sign_in current_user
    end

    it 'has a valid factory' do
      expect(create(:user)).to be_valid
      expect(create(:article)).to be_valid
      expect(create(:comment)).to be_valid
    end

    it 'creates a new comment' do
      current_user.comments << comment
      expect(response).to be_successful
    end
  end
  describe '#destroy' do
    it 'destroys a comment' do
      expect { delete :destroy, id: comment.id, article: article.id }
    end
  end
end
