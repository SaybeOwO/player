class RegistrationController < ApplicationController
    def test
        @user = User.new
    end
end