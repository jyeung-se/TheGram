class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes
  has_many :comments

  has_attached_file :avatar, styles: { thumb: "77x77>", real_small: "77x77>"  }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  def following?(user_id)
    if self.active_relationships.find_by(followed_id: user_id) != nil
      true
    else
      false
    end
  end

  def follow!(user_id)
    self.active_relationships.create(followed_id: user_id)
  end

  def unfollow!(user_id)
    self.active_relationships.find_by(follower_id: user_id).destroy
  end

end
