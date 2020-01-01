require 'test_helper'

class ChallengeStatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_statement = challenge_statements(:one)
  end

  test "should get index" do
    get challenge_statements_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_statement_url
    assert_response :success
  end

  test "should create challenge_statement" do
    assert_difference('ChallengeStatement.count') do
      post challenge_statements_url, params: { challenge_statement: { description: @challenge_statement.description, title: @challenge_statement.title } }
    end

    assert_redirected_to challenge_statement_url(ChallengeStatement.last)
  end

  test "should show challenge_statement" do
    get challenge_statement_url(@challenge_statement)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_statement_url(@challenge_statement)
    assert_response :success
  end

  test "should update challenge_statement" do
    patch challenge_statement_url(@challenge_statement), params: { challenge_statement: { description: @challenge_statement.description, title: @challenge_statement.title } }
    assert_redirected_to challenge_statement_url(@challenge_statement)
  end

  test "should destroy challenge_statement" do
    assert_difference('ChallengeStatement.count', -1) do
      delete challenge_statement_url(@challenge_statement)
    end

    assert_redirected_to challenge_statements_url
  end
end
