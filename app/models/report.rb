class Report < ApplicationRecord
  belongs_to :user
  attachment :image
end
