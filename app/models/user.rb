class User < ApplicationRecord
    has_many :enteries
    has_many :boards, through :enteries
    has_many :tasks
    has_many :stories, through: tasks
    accepts_nested_attributes_for :enteries
    devise :database_auth, :registrable,
    :recoverable, :rememberable, :validatable
end