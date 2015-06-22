class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort.reverse
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
