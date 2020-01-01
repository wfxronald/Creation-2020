require "application_system_test_case"

class ChallengeStatementsTest < ApplicationSystemTestCase
  setup do
    @challenge_statement = challenge_statements(:one)
  end

  test "visiting the index" do
    visit challenge_statements_url
    assert_selector "h1", text: "Challenge Statements"
  end

  test "creating a Challenge statement" do
    visit challenge_statements_url
    click_on "New Challenge Statement"

    fill_in "Description", with: @challenge_statement.description
    fill_in "Title", with: @challenge_statement.title
    click_on "Create Challenge statement"

    assert_text "Challenge statement was successfully created"
    click_on "Back"
  end

  test "updating a Challenge statement" do
    visit challenge_statements_url
    click_on "Edit", match: :first

    fill_in "Description", with: @challenge_statement.description
    fill_in "Title", with: @challenge_statement.title
    click_on "Update Challenge statement"

    assert_text "Challenge statement was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge statement" do
    visit challenge_statements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge statement was successfully destroyed"
  end
end
