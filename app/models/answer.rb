class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :provider, class_name: 'User', foreign_key: 'user_id'

  validates :body, presence: true

  def provider_name
    provider.name
  end
end
