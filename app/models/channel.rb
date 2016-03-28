class Channel < ActiveRecord::Base
  validates :owner_id, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :owner, class_name: User
end
