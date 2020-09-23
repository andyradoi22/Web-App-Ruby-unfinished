require 'spec_helper'

RSpec::Matchers.define :permit do |action|
    match do |policy|
      policy.public_send("#{action}?")
    end
  
    failure_message do |policy|
      "#{policy.class} does not permit #{action} on #{policy.record} for #{policy.user.inspect}."
    end
  
    failure_message_when_negated do |policy|
      "#{policy.class} does not forbid #{action} on #{policy.record} for #{policy.user.inspect}."
    end
  end
  
describe BoardPolicy do
  subject { BoardPolicy.new(user, board) }

  let(:board) { FactoryBot.create(:board, {name: "Anything", description: "Anything"}) }

  context "for a visitor" do
    let(:user) { nil }

    it { should     permit(:index)    }
    it { should     permit(:show)    }
  end

  context "for a user" do
    let(:user) { FactoryBot.create(:user, {email: "specs@wrimble.com", password: "testPassword1", password_confirmation: "testPassword1"})}
    
    it { should permit(:index)    }
    it { should permit(:show)    }
  end
end