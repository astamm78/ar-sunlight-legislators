require_relative '../config'

class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |pol|
      pol.string :title       
      pol.string :firstname
      pol.string :lastname
      pol.string :party
      pol.string :state
      pol.boolean :in_office
      pol.string :gender
      pol.string :phone
      pol.string :website
      pol.date :birthdate
      pol.string :twitter_id
     end
  end
end
