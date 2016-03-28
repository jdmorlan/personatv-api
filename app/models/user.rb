class User < ActiveRecord::Base
  has_one :account
  has_many :social_accounts

  delegate :authenticate, to: :account

  has_many :channels, foreign_key: 'owner_id', class_name: Channel
end
