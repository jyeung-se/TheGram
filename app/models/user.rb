class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy


  def followers
      @all_followers = self.active_relationships.map do |followed|
        User.find(followed.followed_id).username
      end
  end

  def following
    # @all_following
  end

  def self.followers #helper methods for later on
    # @
  end
end
