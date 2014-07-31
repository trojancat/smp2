class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string      :title
      t.text        :description
      t.belongs_to  :owner
      t.integer     :status

      t.timestamps
    end
  end
end
