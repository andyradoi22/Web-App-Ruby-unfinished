require 'rails_helper'

RSpec.describe Story, type: :model do

  let(:board) {FactoryBot.create(:board, {name: "Anything", description: "Anything"})}
  let(:column) {FactoryBot.create(:column, {title: "Anything", order: 1})}
  let(:stories) {FactoryBot.create(:stories, {task: "Anything", info: "Anything", order: 0, tag: "Anything", status: "Anything", due: DateTime.now })}

  describe "Validations" do
    it "is valid with valid attributes" do
      column = board.columns.new(title: "Anything", order: 1)
      story = column.stories.new(task: "Anything",
        info: "Anything",
        order: 0,
        tag: "Anything",
        status: "Anything",
        due: DateTime.now)
      expect(story).to be_valid
    end

    it "is not valid without a task" do
      column = board.columns.new(title: "Anything", order: 1)
      story = column.stories.new(task: "Anything",
        info: "Anything",
        order: 0,
        tag: "Anything",
        status: "Anything",
        due: DateTime.now)
      story.task = nil
      expect(story).to_not be_valid
    end
  end
end