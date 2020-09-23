require 'rails_helper'

RSpec.describe Board, type: :model do

  let(:board) {FactoryBot.create(:board, {name: "Anything", description: "Anything"})}

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(board).to be_valid
    end

    it "is not valid without a name" do
      board.name = nil
      expect(board).to_not be_valid
    end
  end

end