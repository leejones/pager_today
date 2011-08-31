class Schedule < PagerDuty::Schedule
  attr_accessor :id

  def self.find_by_name_or_id(param)
    find_by_name(param) || find(param)
  end
  
  def self.find_by_name(name)
    data.select { |s| s[:name] == name }.map { |s| new s[:id] }.first
  end
  
  def self.find(id)
    data.select { |s| s[:id] == id }.map { |s| new s[:id] }.first
  end
  
  def self.all
    data.map { |s| new s[:id] }
  end

  def self.first
    all.first
  end

  private

  def self.data
    @data ||= YAML.load_file(File.join(Rails.root, 'config', 'pager_duty.yml')).fetch(:schedules, [])
  end
end