class NewPandaApi < ActiveRecord::Migration
  def self.up
    add_column :videos, :filename, :string
    add_column :videos, :original_filename, :string
    add_column :videos, :screenshot, :string
    add_column :videos, :thumbnail, :string
    add_column :videos, :duration, :integer
    remove_column :videos, :video_url
  end

  def self.down
  end
end
