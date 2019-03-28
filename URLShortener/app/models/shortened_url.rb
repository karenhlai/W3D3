# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint(8)        not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, uniqueness: true
  validates :short_url, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.random_code
    random = SecureRandom.urlsafe_base64
    while self.exists?(random)
      random = SecureRandom.urlsafe_base64
    end 
    random
  end

  def self.create!(user, looong_url) #long->new ShortenedURL instance
    random = ShortenedUrl.random_code
    new_instance = ShortenedUrl.new(user_id: user.id, long_url: looong_url, short_url: random)
    new_instance.save!
  end

  
end
