# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

question1 = Question.create(title: "The best question ever to be asked in the history of the universe", description: "How much wood would a woodchuck chuck if a woodchuck could chuck wood? Please tell me...I have a serious woodchuck-chucking-wood at me problem. dhofdshjlfhvldfbjgdofgjodfgjdfljvldfvjo.", user_id: 1)

answer1 = Answer.create(answer: "I have an answer for you, but before I tell you, let me tell you all the ways in which you are a terrible human being.", question_id: question1.id, user_id: 88)

answer2 = Answer.create(answer: "Don't listen to that other guy. You're not a terrible human being. It's just a terrible terrible question and you should not be allowed to ask any more questions. Ever.", question_id: question1.id, user_id: 89)
