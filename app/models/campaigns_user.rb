class CampaignsUser < ApplicationRecord
  belongs_to :profile, optional: true
  belongs_to :compaign, optional: true
end
