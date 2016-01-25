class CreateUsers < ActiveRecord::Migration
 
  def up
    create_table :users do |t|
     	t.column "first_name" , :string, :limit => 30
     	t.string "last_name", :limit => 30
     	t.string "email", :default => "" , :null => false
     	t.string "password", :limit => 30
         t.timestamps
     end
  end

  def dowm
  	 drop_table :users
  end

end
