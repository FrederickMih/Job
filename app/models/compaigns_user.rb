class CompaignsUser < ApplicationRecord
  belongs_to :profile
  belongs_to :compaign
end
