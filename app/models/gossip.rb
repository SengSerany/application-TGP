class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :join_table_gossip_tags 
  has_many :tags, through: :join_table_gossip_tags
  has_many :likes, :as => :likeable, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

end
