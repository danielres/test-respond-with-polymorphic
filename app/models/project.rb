class Project < ActiveRecord::Base
  attr_accessible :name, :tag_tokens
  attr_reader :tag_tokens
  validates :name, :presence => true

  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  has_many :comments, :as => :commentable

  has_many :tasks

  def to_s
    name
  end

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end

end
