class QuestionsController < ApplicationController
  def index
    @questions = Question.public_questions
    
    user = User.find_by(name: params[:query])
    @questions = @questions.where(user_id: user.id) if user
  end
end
