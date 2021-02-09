class Request < ApplicationRecord
  belongs_to :user
  belongs_to :operator, class_name:"User", foreign_key:"operator_id"
  belongs_to :product
end
