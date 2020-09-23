require 'rails_helper'

RSpec.describe Column, type: :model do

  let(:board) {FactoryBot.create(:board, {name: "Anything", description: "Anything"})}
  let(:column) {FactoryBot.create(:column, {title: "Anything", order: 1})}

  describe "Validations" do
    it "is valid with valid attributes" do
      column = board.columns.new(title: "Anything", order: 1)
      expect(column).to be_valid
    end

    it "is not valid without a title" do
      column = board.columns.new(title: nil, order: 1)
      expect(column).to_not be_valid
    end
  end
end