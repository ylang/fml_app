class Message < ActiveRecord::Base
  attr_accessible :answer, :challenge_question, :content, :score, :title
  has_many :replies, :dependent => :destroy

  validates :title, :content, :challenge_question, :answer,  :presence => true
  validates :title, :length => {:maximum => 200}

end
