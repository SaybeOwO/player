require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should exist' do
    expect(defined?(User)).to_not be_nil
  end

  describe 'instance' do
    subject(:user) { described_class.new(email: 'test@example.com', password: 'test', password_confirmation: 'test') }

    it { is_expected.to have_attribute(:email) }
    it { is_expected.to have_attribute(:password_digest) }

    it 'should validate presence of email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'should validate email uniqueness' do
      User.create(email: user.email, password: 'test', password_confirmation: 'test')
      expect(user).to_not be_valid
    end
  end
end
