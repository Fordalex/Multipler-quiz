class Question < ApplicationRecord
  def question_for(questioner_name)
    question.gsub(/%{questioner}/, "#{questioner_name}")
  end
end
