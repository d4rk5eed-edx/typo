class AddArticleIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :migration_id, :integer
  end

  def self.down
    remove_column :articles, :migration_id
  end
end
