require 'rails_helper'

RSpec.describe Entry, type: :model do
  
  let(:user) {FactoryBot.create(:user, {email: "testaccount@domain.com", password: "temppassword", password_confirmation: "temppassword"})}
  let(:board) {FactoryBot.create(:board, {name: "test board"})}
  let(:entry) {FactoryBot.create(:entry, {board: board, user: user})}

  describe "Validations" do
    it "is valid with valid attributes" do
     expect(entry).to be_valid
    end

    it "is not valid without user and board ids" do
      entry.user_id = nil
      entry.board_id = nil
      expect(entry).to_not be_valid
    end
  end

end