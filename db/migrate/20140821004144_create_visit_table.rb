class CreateVisitTable < ActiveRecord::Migration
  def change
    create_table :visit_tables do |t|
      t.integer :visitor
      t.string :short_url
      t.timestamps
    end
    add_index(:visit_table, :visitor)
    add_index(:visit_table, :short_url)
    add_index(:visit_table, [:visitor, :short_url])
  end
end
