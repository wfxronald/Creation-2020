class StaticPagesController < ApplicationController
  def home
  end

  def faq
  end

  def rules
  end

  def challenge_statement_1
    @challenge_statement = ChallengeStatement.find(1)
  end

  def challenge_statement_2
    @challenge_statement = ChallengeStatement.find(2)
  end

  def challenge_statement_3
    @challenge_statement = ChallengeStatement.find(3)
  end

end
