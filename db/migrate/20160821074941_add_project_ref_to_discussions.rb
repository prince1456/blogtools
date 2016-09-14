class AddProjectRefToDiscussions < ActiveRecord::Migration[5.0]
  def change
    add_reference :discussions, :project, foreign_key: true
  end
end
