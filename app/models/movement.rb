class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :type_movement
end
