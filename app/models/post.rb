class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments
  def publish!
    published = true
    save!
  end
end
