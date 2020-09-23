class BoardPolicy < ApplicationPolicy
    attr_reader :user, :board

    def initialize(user, board)
        @user = user
        @board = board
    end

    def index?
        true
    end

    def show?
        true
    end
end