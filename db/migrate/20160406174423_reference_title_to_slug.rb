class ReferenceTitleToSlug < ActiveRecord::Migration
  def change
      remove_column :refs, :title
      add_column :refs, :slug, :string
  end
end
