require 'rails_helper'

RSpec.describe Visible do
  let(:user) { create(:user) }
  let(:public_article) { FactoryBot.create(:article) }
  let(:arch_article) { FactoryBot.create(:arch_article) }
  let(:invalid_article) { FactoryBot.create(:invalid_status) }

  describe '.archived?' do
    it 'article has public status' do
      expect(public_article.archived?).to eq(false)
    end
    it 'article has archived status' do
      expect(arch_article.archived?).to eq(true)
    end
  end
end
