class ExtendCompanies < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.string :logo
      t.string :cover
      t.date   :founded_on
      
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
