class SubmissionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.submission_mailer.submit_upload.subject
  #
  def submit_upload(submission)
    @title = submission.challenge_statement.title
    @upload = submission.file.filename
    @update = submission.updated_at
    mail to: submission.user.email, from: "creation@nussucommit.com"
  end
end
