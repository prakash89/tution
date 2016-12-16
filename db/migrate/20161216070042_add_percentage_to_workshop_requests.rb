class AddPercentageToWorkshopRequests < ActiveRecord::Migration
  def change
    add_column :workshop_requests, :percentage, :string
  end
end
