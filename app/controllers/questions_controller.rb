class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort.reverse
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question submitted."
      redirect_to '/questions'
    else
      flash[:error] = @question.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
