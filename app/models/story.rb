class Story < ApplicationRecord
    belongs_to :column
    validates :task, presence: true
    scope :filter_by_status, -> (status) {where status: status}
    scope :filter_by_tag, -> (due) {where tag: tag}
    scope :filter_by_duedate, -> (due){where due: due}
    has_many :tasks
    has_many :users, through: :tasks
end