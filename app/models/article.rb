class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String
  field :rating, type: Integer, default: 0

  belongs_to :user

  delegate :info, to: :user, prefix: true, allow_nil: true
end
