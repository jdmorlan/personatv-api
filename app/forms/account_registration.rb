class AccountRegistration < Reform::Form
  include Composition

  attr_reader :user

  property :email,                  on: :user
  property :first_name,             on: :user
  property :last_name,              on: :user
  property :password,               on: :account
  property :password_confirmation,  on: :account

  validates :email,                 presence: true
  validates :first_name,            presence: true
  validates :last_name,             presence: true
  validates :password,              presence: true
  validates :password,              confirmation: true
  validates :password_confirmation, presence: true

  def save
    data = self.to_nested_hash
    @user = User.new(data[:user])
    @user.account = Account.new(data[:account])
    @user.save
  end
end
