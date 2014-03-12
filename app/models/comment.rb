class Comment < ActiveRecord::Base
  belongs_to :post
  # attr_accessible :author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :content, :approved, :post_id

  # validates :content,       presence: true
  # validates :author_email,  presence: true
  # validates :author,        presence: true
end
