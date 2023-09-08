# frozen_string_literal: true

RSpec.describe 'Songs', type: :request do
  let(:user) { User.new(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

  describe 'GET /songs' do
    before do
      user.save!
      post signin_path, params: { email: user.email, password: 'password' }
    end

    it 'goes to song menu' do
      get songs_path
      expect(response).to have_http_status(:success)
    end
  end
end
