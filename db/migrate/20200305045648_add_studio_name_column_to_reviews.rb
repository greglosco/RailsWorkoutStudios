class AddStudioNameColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :studio_name, :string
  end
end
