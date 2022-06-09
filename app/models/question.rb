class Question < ActiveRecord::Base
  has_many :answers

  belongs_to :asker, class_name: 'User', foreign_key: :user_id

  validates :title, presence: true

  scope :public_questions, -> { includes(:answers, :asker).where(private: false) }

  def asker_name
    asker.name
  end
end
