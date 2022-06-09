class WelcomeController < ApplicationController
  skip_before_action :authenticate_tenant!, only: :index

  def index
    @users_count = User.count
    @questions_count = Question.count
    @answers_count = Answer.count
    @total_requests = Tenant.total_requests
  end
end
