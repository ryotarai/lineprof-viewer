require 'pathname'

class ProfiledFile < ActiveRecord::Base
  belongs_to :profile
  has_many :records, class: ProfileRecord

  def source_file
    Rails.root.join(
      'sources',
      profile.tag_value('application'),
      profile.tag_value('revision'),
      relative_path)
  end

  def source
    @source ||= source_file.read
  end

  def relative_path
    Pathname.new(path).relative_path_from(
      Pathname.new(profile.root_path))
  end
end
