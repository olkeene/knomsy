class ExtendUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :username, limit: 50
      t.string :about
      t.string :avatar
      t.string :cover
      t.string :country
      t.string :city
      
      t.string :gplay_link
      t.string :itunes_link
      t.string :dribbble_link
      t.string :fb_link
      t.string :gh_link
      t.string :gplus_link
      t.string :linkedin_link
      t.string :twitter_link
      t.string :youtube_link
      t.string :website
    end
  end
end
