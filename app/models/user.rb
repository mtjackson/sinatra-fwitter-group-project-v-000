class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.find do |user|
      if slug == user.slug
        user
      end
    end
  end
end
