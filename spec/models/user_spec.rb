require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryBot.create(:user, {email: "testaccount@domain.com", password: "temppassword", password_confirmation: "temppassword"})}

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid without password" do
      user.password = nil
      expect(user).to_not be_valid
    end
  end

  describe "Authentications" do
    it "cannot login without password" do
      user.password = user.password + "_"
      expect(user).to_not be_valid
    end
  end
  
end