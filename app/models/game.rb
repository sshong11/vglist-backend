class Game < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reviews
end
