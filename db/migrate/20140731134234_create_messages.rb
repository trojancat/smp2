class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string            :title
      t.text              :body
      t.integer           :status
      t.belongs_to        :sender
      t.belongs_to        :acceptor

      t.timestamps
    end
  end
end
