class CreateJoinTableExpertiseProfessor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cities, :jobs do |t|
      # t.index [:city_id, :job_id]
      # t.index [:job_id, :city_id]
    end
  end
end
