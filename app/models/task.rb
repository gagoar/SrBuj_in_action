class Task < ActiveRecord::Base
  attr_accessible :content

  validates :content, presence: true

  belongs_to :list
end
