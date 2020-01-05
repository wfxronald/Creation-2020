# Preview all emails at http://localhost:3000/rails/mailers/submission_mailer
class SubmissionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/submission_mailer/submit_upload
  def submit_upload
    submission = Submission.new name: 'marflar',
                                filename: 'marflar@example.org',
                                body: 'This is the body of the email'

    SubmissionMailer.submit_upload
  end

end
