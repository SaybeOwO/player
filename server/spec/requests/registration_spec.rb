# frozen_string_literal: true

RSpec.describe 'Registration', type: :request do
  let(:password) { SecureRandom.alphanumeric }
  let(:user) { User.new(email: 'test@example.com', password: password, password_confirmation: password) }

  describe 'user is signing up' do

    it 'user is signed up' do
      post signup_path, params: { user: { email: user.email, password: password, password_confirmation: password } }
      expect(response).to redirect_to(root_path)
    end
  end
end

