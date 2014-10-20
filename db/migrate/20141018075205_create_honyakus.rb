class CreateHonyakus < ActiveRecord::Migration
  def change
    create_table :honyakus do |t|
      t.string :question_body
      t.string :name

      t.timestamps
    end
  end
end
