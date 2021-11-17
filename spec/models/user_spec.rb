require 'rails_helper'

RSpec.describe User, type: :model do
  FactoryBot.define do
    factory :user do
      email { 'anbarco@unicauca.edu.co' }
      password { 'password' }
      password_confirmation { 'password' }
    end
  end
  context 'validate tests' do
    describe 'email' do
      it 'does be present' do
        is_expected.to validate_presence_of(:email)
      end
      it { is_expected.not_to allow_value('anbarco.com').for(:email)}
      it { is_expected.to allow_value('anbarco@gmail.co').for(:email)}
    end
    describe 'password' do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_length_of(:password).is_at_least(6)}
    end
  end
end
