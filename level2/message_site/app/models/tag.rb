class Tag < ApplicationRecord
    has_many :messages
    validates :name, presence: true
end
