class Client < ApplicationRecord
  has_many :client_providers, dependent: :destroy
  has_many :providers, through: :client_providers

  has_many :journal_entries, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
