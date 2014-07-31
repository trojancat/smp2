class CreateMeetingsUsers < ActiveRecord::Migration
  def change
    create_table :meetings_users do |t|
      t.belongs_to        :meeting
      t.belongs_to        :user
    end
  end
end
