# frozen_string_literal: true

RSpec.describe 'Sessions', type: :request do
  let(:password) { SecureRandom.alphanumeric }
  let(:user) { User.new(email: 'test@example.com', password: password, password_confirmation: password) }

  before do
    user.save!
    # post signin_path, params: { email: user.email, password: 'password' }
  end

  describe 'signin in' do

    it 'user is signed in' do
      post signin_path, params: { email: user.email, password: password }
      expect(response).to redirect_to(root_path)
    end

    it 'user is logged out' do
      delete logout_path
      expect(response).to redirect_to(root_path)
    end

    pending 'prevent email duplication on sign up'

  end

  describe '/signin' do
    let(:login_password) { password }
    before do
      delete logout_path
      post signin_path, params: { email: user.email, password: login_password }
    end

    context 'when login data is invalid' do
      let(:login_password) { 'invalid' }

      it 'should return 401' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when login data is valid' do
      it 'should redirect to root path' do
        expect(response).to redirect_to root_path
      end
    end
  end
end