# frozen_string_literal: true

json.extract! photo, :id, :title, :caption, :created_at, :updated_at
json.url photo_url(photo, format: :json)
