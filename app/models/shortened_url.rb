class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :presence => true, :uniqueness => true
  validates :long_url, :submitter_id, :presence => true
  
  belongs_to(
    :submitter,
    class_name: "User",
    foreign_key: :submitter_id,
    primary_key: :id
  )
   
  
  def self.random_code 
    exist = true
    while exist
      possible_shorten_url = SecureRandom.urlsafe_base64
      exist = ShortenedUrl.exists?(possible_shorten_url)
    end
    possible_shorten_url
  end
  
  def self.create_for_user_and_long_url!(user, long_url)
    short_url = self.random_code
    ShortenedUrl.create!(
      submitter_id: user.id,
      long_url: long_url,
      short_url: short_url
    )
  end
  
  
end


