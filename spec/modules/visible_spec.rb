require 'rails_helper'

RSpec.describe Visible do
  let(:current_user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: current_user) }
  let(:comment) { FactoryBot.create(:comment, user: current_user, article: article) }
  describe '.archived?' do
    context 'articles status' do
      it 'expects false when public' do
        expect(article.archived?).to eq(false)
      end

      it 'expects true when archived' do
        article.status = 'archived'
        expect(article.archived?).to eq(true)
      end

      it 'expects false when private' do
        article.status = 'private'
        expect(article.archived?).to eq(false)
      end
    end
    context 'comments status' do
      it 'expects false when public' do
        expect(comment.archived?).to eq(false)
      end

      it 'expects true when archived' do
        comment.status = 'archived'
        expect(comment.archived?).to eq(true)
      end

      it 'expects false when private' do
        comment.status = 'private'
        expect(comment.archived?).to eq(false)
      end
    end
  end
end
