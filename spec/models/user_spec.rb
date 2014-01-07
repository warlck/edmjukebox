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

            it "add #artists method to user" do
                expect(user).to respond_to(:artists)
            end

            it "associates artist with user through subscriptions" do
                user.subscriptions.create(artist_id: artist.id)
                expect(user.reload.artists).to eq [artist]
            end
            
        end
    end

    describe "podcast time association" do
        let(:user) { create(:user)}
        let(:podcast) { create(:podcast)}
        it "is defined" do
            expect(user).to respond_to :podcast_times
        end

        it "creates podcast_time associated to user" do
            podcast_time = PodcastTime.new(user_id: user.id, podcast_id: podcast.id, time: 0)
            user.podcast_times << podcast_time
            expect(user.podcast_times.first).to eq podcast_time
        end

        describe "related update_time method" do
            it "is defined" do
                expect(user).to respond_to :update_time
            end

            it "expects an argument" do
                expect {user.update_time}.to raise_error
            end

            it "creates podcast_time instance for given podcast if not already present" do
                expect{user.update_time(podcast)}.to change{user.podcast_times.count}.by(1)
            end

            it "updates time of existing podcast_time association instance" do
                user.update_time podcast
                user.update_time podcast , 10
                expect(user.podcast_times.first.time).to eq 10
            end

        end

        describe "related track_time method" do
            it "is defined" do
                expect(user).to respond_to :track_time
            end

            it "expects and argument" do
                expect{user.track_time}.to raise_error
            end

            it "returns time of users podcast_time association instance" do
                 user.update_time podcast, 10
                 expect(user.track_time podcast).to eq 10
            end

            it "returns 0 if podcast_time association instance is not defined for give podcast" do
               expect(user.track_time podcast).to eq 0  
            end
            
        end
         
    end






end


def user_invalid_without attribute
    user = build_stubbed(:user, attribute => nil)
    expect(user).to be_invalid
end
