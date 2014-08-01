class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string        :title
      t.text          :description
      t.integer       :status
      t.belongs_to    :owner
      t.belongs_to    :project

      t.timestamps
    end
  end
end
