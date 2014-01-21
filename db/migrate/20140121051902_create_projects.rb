class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :technologies_used

      t.timestamps
    end
  end
end
