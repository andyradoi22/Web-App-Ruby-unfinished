class Board < ApplicationRecord
    validates :name, presence: true
    has_many :columns, dependent: :destroy
    has_many :entries
    has_many :users, throught: :enteries
    accepts_nested_attributes_for :enteries
end