require 'spec_helper'

describe User do

    describe "instance" do
    	let(:user) { build_stubbed(:user)}
    	subject { user }

    	it { should respond_to(:email)}
    	it { should respond_to(:password)}
    	it { should respond_to(:password_digest)}
        it { should respond_to(:name) }
        it { should respond_to(:auth_token)}
    end

    it "is invalid without email address" do
    	user_invalid_without :email
    end

    it "is invalid without password" do
        user_invalid_without :password
    end


    it "is invalid without name" do
        user_invalid_without :name
    end


    describe "email" do
        it "is unique" do
            create(:user, email: "foo@bar.com")
            user = build(:user, email: "foo@bar.com")
            expect(user).to have(1).errors_on(:email) 
        end
    end


    describe "auth_token" do
        let(:user) { create(:user) }
        it "is defined when user is created" do
            expect(user.auth_token).not_to be_nil
        end
    end


    describe "#send_password_reset" do
        let(:user) { create(:user)}

        it "generates unique password reset token each time" do
            user.send_password_reset
            last_token = user.password_reset_token
            user.send_password_reset
            expect(user.password_reset_token).not_to eq(last_token)
        end

        it "saves the time password reset was sent" do
            user.send_password_reset
            expect(user.reload.password_reset_sent_at).to be_present
        end

        it "delivers email to user" do
            user.send_password_reset
            expect(last_email.to).to include(user.email)
        end
    end


    describe "subscriptions association" do
        let(:user) { create(:user)}
        it "are defined" do
            expect(user).to respond_to(:subscriptions)
        end

        context "creating and deleting subscription objects " do
            let(:sub) { Subscription.new}
            before(:each) { user.subscriptions << sub}
            it "can create subscriptions associated to user" do
              expect(user.subscriptions).not_to be_empty
            end

            it "creates Subscription object in database" do
              expect(Subscription.all).not_to be_empty
            end

            it "deletes associated subscriptions on object deletion" do
                user.destroy
                expect(Subscription.all).to be_empty
            end
        end

     

        context "artist subscribing" do
            let(:artist) {create(:artist)}

            it "add artists methods to user" do
                expect(user).to respond_to(:artists)
            end

            it "associates artist with user through subscriptions" do
                user.subscriptions.create(artist_id: artist.id)
                expect(user.reload.artists).to eq [artist]
            end
            
        end
    end






end


def user_invalid_without attribute
    user = build_stubbed(:user, attribute => nil)
    expect(user).to be_invalid
end
