class ChangeDataTypeForStartingYear < ActiveRecord::Migration[5.2]
  def self.up
    change_table :generations do |t|
      t.change :starting_year, :year
    end
  end
  def self.down
    change_table :generations do |t|
      t.change :starting_year, :date
    end
  end
end
