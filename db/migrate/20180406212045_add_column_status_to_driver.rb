class AddColumnStatusToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column(:drivers, :available, :boolean,{null: true, default: true})
  end
end
