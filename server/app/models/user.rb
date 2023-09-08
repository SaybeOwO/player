#email:string password_digest:string password:string virtual

class User < ApplicationRecord
    has_secure_password #per password cifrata

    has_many :songs, foreign_key: :uid

    validates :email, presence: true, uniqueness: true #controlla che venga inserita una mail
end
