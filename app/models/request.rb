class Request < ApplicationRecord
  IN_PROGRESS = 'in_progress'.freeze
  FINISHED = 'finished'.freeze
  CANCELED = 'canceled'.freeze

  belongs_to :user
  belongs_to :operator, class_name: 'User'
  belongs_to :product
end
