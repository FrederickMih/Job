class Campaign < ApplicationRecord
  belongs_to :user, optional: true

  has_many :campaigns_users
  has_many :profiles, through: :campaigns_users
  accepts_nested_attributes_for :campaigns_users
  enum status: %i[draft publish]
end
