require 'rails_helper'

RSpec.describe User, type: :model do
  let(:current_user) { FactoryBot.create(:user) }
  context 'validate tests' do
    describe 'email' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.not_to allow_value('anbarco.com').for(:email) }
    end
    describe 'password' do
      it { is_expected.to validate_presence_of(:password) }
      it { expect(current_user.password.length).to be >= 6 }
      it { expect(current_user.password.to_s).to eq(current_user.password_confirmation.to_s) }
    end
  end
end
