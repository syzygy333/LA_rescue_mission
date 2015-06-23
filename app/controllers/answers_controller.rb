class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer submitted."
      redirect_to @answer.question
    else
      flash[:error] = @answer.errors.full_messages.join(". ")
      @question = @answer.question
      @answers = @question.answers
      render 'questions/show'
    end
  end


  private
  def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end
end
