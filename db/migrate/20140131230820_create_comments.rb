class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :author_url
      t.string :author_email
      t.string :user_ip
      t.string :user_agent
      t.string :referrer
      t.text :content
      t.boolean :approved
      t.references :post, index: true

      t.timestamps
    end
  end
end
