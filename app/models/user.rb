class User
  attr_accessor :id, :name, :email
  attr_reader :first_name

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @email = attributes[:email]
  end

  def first_name
    @name.split(/\s/)[0]
  end

  def self.find_by_first_name(name)
    all.select { |u| u.first_name =~ /#{name}/i }.first
  end

  def self.all
    data.map { |u| new u }
  end

  def self.data
    @data ||= YAML.load_file(File.join(Rails.root, 'config', 'pager_duty.yml')).fetch(:users, [])
  end

  def to_param
    first_name.downcase
  end
end