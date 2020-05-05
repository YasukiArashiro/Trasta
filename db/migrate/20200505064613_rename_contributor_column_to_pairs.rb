class RenameContributorColumnToPairs < ActiveRecord::Migration[5.2]
  def change
  	rename_column :pairs, :contributor, :contributor_id
  	rename_column :pairs, :opponent, :opponent_id
  end
end
