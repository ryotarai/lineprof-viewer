class ProfileRecord < ActiveRecord::Base
  belongs_to :profiled_file

  def source
    profiled_file.source.lines[line - 1]
  end
end
