# frozen_string_literal: true

class Photo < ApplicationRecord
  has_one_attached :photo
end
