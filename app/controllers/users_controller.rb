class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all.where(:admin => false)
    @challenge_statements = ChallengeStatement.all
  end
end
