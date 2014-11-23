class Profile < ActiveRecord::Base
  has_many :files, class: ProfiledFile
  has_many :tags, class: ProfileTag

  def self.new_from_fluentd_record(params)
    profile = self.new

    profile.root_path = params['root_path']
    params['tags'].each_pair do |key, value|
      profile.tags << ProfileTag.new(key: key, value: value)
    end
    params['profile'].each_pair do |path, data|
      profile.files << ProfiledFile.new.tap do |file|
        records = []
        data.each_with_index do |datum, index|
          next if index == 0
          wall, cpu, calls, allocations = datum
          records << ProfileRecord.new(
            line: index,
            wall: wall,
            cpu: cpu,
            calls: calls,
            allocations: allocations,
          )
        end

        total_wall_time, child_wall_time, exclusive_wall_time, total_cpu_time, child_cpu_time, exclusive_cpu_time, allocations = data[0]

        file.path = path
        file.total_wall_time = total_wall_time
        file.child_wall_time = child_wall_time
        file.exclusive_wall_time = exclusive_wall_time
        file.total_cpu_time = total_cpu_time
        file.child_cpu_time = child_cpu_time
        file.exclusive_cpu_time = exclusive_cpu_time
        file.allocations = allocations
        file.records << records
      end
    end

    profile
  end
end
