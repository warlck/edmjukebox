class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password
  has_many :subscriptions, dependent: :destroy
  has_many :artists, through: :subscriptions


  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
   


  before_create { generate_token(:auth_token)}

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def subscribe_to_artist artist_id
    self.subscriptions.create(artist_id: artist_id)
  end

  def subscribed_to artist
    self.artists.include? artist
  end


  private 
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

end
