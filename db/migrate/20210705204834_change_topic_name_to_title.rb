class ChangeTopicNameToTitle < ActiveRecord::Migration[6.1]
  def change
    rename_column :topics, :name, :title
  end
end
