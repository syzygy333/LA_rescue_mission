class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort.reverse
  end

  def show
    @question = Question.find(params[:id])
  end
end
