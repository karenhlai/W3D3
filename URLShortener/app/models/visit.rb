class Visit < ApplicationRecord
  validations :user_id, presence: true
  validations :shortened_url_id, presence: true

  def self.record_visit!(user, shortened_url)
    new_visitor = Visit.new(user_id: user.id, shortened_url_id: shortened_url.id)
    new_visitor.save!
  end

  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id, 
    class_name: :User
end
