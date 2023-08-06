#email:string password_digest:string password:string virtual

class User < ApplicationRecord
    has_secure_password #per password cifrata

    validates :email, presence: true#controlla che venga inserita una mail
end
