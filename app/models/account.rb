class Account < ApplicationRecord
  belongs_to :customer
  belongs_to :type_account
  has_many :movements
end
