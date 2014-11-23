class ProfiledFile < ActiveRecord::Base
  belongs_to :profile
  has_many :records, class: ProfileRecord
end
