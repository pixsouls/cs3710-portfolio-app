class AddFirstNameToStudents < ActiveRecord::Migration[6.0]
    def change
      add_column :students, :first_name, :string
      add_column :student, :last_name, :string
      remove_column :student, :namke, :string
    end
  end
  