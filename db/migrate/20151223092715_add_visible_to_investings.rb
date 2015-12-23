class AddVisibleToInvestings < ActiveRecord::Migration
  def up
    add_column :investings, :visible, :boolean, default: true
    Investing.update_all visible: true
  end
  
  def down
    remove_column :investings, :visible
  end
end
