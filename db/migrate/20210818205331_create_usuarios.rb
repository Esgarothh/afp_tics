class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :contrasena

      t.timestamps
    end
  end
end
