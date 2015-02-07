class Entry < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates_length_of :content, :minimum => 5
  belongs_to :user
  has_many :comments
end
