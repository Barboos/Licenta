class Apartament < ApplicationRecord
    validates :title, presence: true, length: {maximum: 255}
    validates :city, presence: true, length: {maximum: 255}
    validates :county, presence: true, length: {maximum: 255}
    validates :price, presence: true, numericality: true
    validates :no_of_rooms, presence: true, numericality: { only_integer: true}
    validates :surface, presence: true, numericality: { only_integer: true}

    default_scope -> { order(created_at: :desc) }

    belongs_to :user
end
