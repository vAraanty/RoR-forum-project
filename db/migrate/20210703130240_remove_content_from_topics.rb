class RemoveContentFromTopics < ActiveRecord::Migration[6.1]
  def change
    remove_column :topics, :content, :text
  end
end
