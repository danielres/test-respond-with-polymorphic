class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :projects,  :through => :taggings, :source => :taggable, :source_type => 'Project'
  has_many :tasks,     :through => :taggings, :source => :taggable, :source_type => 'Task'
  belongs_to :language
  validates :name, :language_id, :presence => true

  def taggables
    projects + tasks
  end

  def to_s
    name
  end

  def self.tokens(query)
    tags = where("name like ?", "%#{query}%")
    if tags.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      tags
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end


end
