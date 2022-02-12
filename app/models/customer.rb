class Customer < ApplicationRecord
    validates_uniqueness_of :token

    has_many :account
end
