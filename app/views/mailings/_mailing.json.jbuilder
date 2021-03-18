json.extract! mailing, :id, :title, :description, :content, :published_at, :created_at, :updated_at
json.url mailing_url(mailing, format: :json)
json.content mailing.content.to_s
