class Comment < ActiveRecord::Base
  belongs_to :post
  # attr_accessible :author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :content, :approved, :post_id
end
