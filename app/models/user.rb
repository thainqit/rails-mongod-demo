class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

  has_many :articles

  def info
    [first_name, last_name].compact.join(' ')
  end
end
