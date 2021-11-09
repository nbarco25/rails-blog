# frozen_string_literal: true

# comment model
class Comment < ApplicationRecord
  include Visible
  belongs_to :article
end