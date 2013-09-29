class Team < ActiveRecord::Base
  attr_accessible :name, :city, :state, :country, :description, :asset, :asset_url, :asset_file_name
  has_attached_file :asset
  has_many :teammates
  has_many :users, through: :teammates

  def missing_asset?
    if self.asset.url == "/assets/original/missing.png"
      return true
    else
      return false
    end
  end
end
