class Reply < ActiveRecord::Base
  attr_accessible :content, :message_id
  belongs_to :message
  validates :content, :presence => true
end
