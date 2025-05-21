class ClientProvider < ApplicationRecord
  belongs_to :client
  belongs_to :provider

  validates :plan, inclusion: { in: [ "basic", "premium" ] }
  validates :client_id, uniqueness: { scope: :provider_id, message: "is already assigned to this provider" }
end
