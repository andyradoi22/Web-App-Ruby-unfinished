class Column < ApplicationRecord
    has_many :stories, dependent: :destroy
    belongs_to :board
    validates :title, presence: true
end