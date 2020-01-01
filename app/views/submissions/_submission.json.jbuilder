json.extract! submission, :id, :title, :upload_id, :created_at, :updated_at
json.url submission_url(submission, format: :json)
