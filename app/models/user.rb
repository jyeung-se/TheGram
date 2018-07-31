class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_attached_file :avatar, styles: { thumb: "77x77>", real_small: "77x77>"  }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def follows
    self.active_relationships.map do |followed|
      User.find(followed.followed_id)
    end
  end

  def followers
    self.active_relationships.map do |follower|
      User.find(follower.follower_id)
    end
  end

  def follow(user_id)
    self.active_relationships.create(followed_id: user_id)
  end

  # def unfollow(user_id)
  #   @user = User.find(user_id)
  #   if @user.active_relationships.user_id == user_id
  #     @user.active_relationships.destroy
  #   end
  # end

end
