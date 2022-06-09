class Tenant < ActiveRecord::Base
  before_create :generate_api_key

  validates :current_day_count, presence: true
  validates :total_requests_count, presence: true
  validates :name, presence: true

  def increment_count!
    update!(current_day_count: current_day_count + 1, total_requests_count: total_requests_count + 1)
  end

  def self.total_requests
    sum(:total_requests_count)
  end

  def valid_request?
    return true if current_day_count < 100
    Time.current >= updated_at + 10.seconds
  end

  def self.reset_all
    Tenant.update_all(current_day_count: 0)
  end
  
  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end
