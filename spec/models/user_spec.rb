require 'spec_helper'

describe User do
    describe "instance" do
    	let(:user) { build_stubbed(:user)}
    	subject { user }

    	it { should respond_to(:email)}
    	it { should respond_to(:password)}
    	it { should respond_to(:password_digest)}
    end

    it "is invalid without email address" do
    	invalid_without :email
    end

    it "is invalid without password" do
        invalid_without :password
    end

    it "is invalid without password confirmation" do
       invalid_without :password_confirmation
    end


end


def invalid_without attribute
    user = build_stubbed(:user, attribute => nil)
    expect(user).to be_invalid
end
