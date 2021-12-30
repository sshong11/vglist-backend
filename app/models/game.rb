class Game < ApplicationRecord
    belongs_to :user, optional: true
end
