class User < ActiveRecord::Base
  has_one :account
  has_many :social_accounts

  delegate :authenticate, to: :account
end
