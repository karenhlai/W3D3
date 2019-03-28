# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl
end

# rails c -> console
# rails g model Class --skip -> create model for Class, skip migration
# rails db:migrate -> migrate all from db to schema.rb
# rails g migration CreateClass -> create hot-plate class seeder
# rails db:seed -> seed from seed.rb
# rails new ProjectName -G --database=postgresql
