class AddStatusToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :status, :string
  end

  def self.down
  end
end
