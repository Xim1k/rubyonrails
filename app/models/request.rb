class Request < ApplicationRecord
  IN_PROGRESS = 'in_progress'
  FINISHED = 'finished'
  CANCELED = 'canceled'

  belongs_to :user
  belongs_to :operator, class_name:"User", foreign_key:"operator_id"
  belongs_to :product
end
