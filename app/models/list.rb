class List < ActiveRecord::Base
  attr_accessible :name, :done_at

  validates :name, presence: true

  has_many :todos, dependent: :destroy
end
