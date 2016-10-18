require 'spec_helper'


RSpec.feature "the user submits and then edits an artist" do
  scenario "the user clicks the edit link" do
    artist_1 = Artist.create(name:"eminem", image_path:"http://gazettereview.com/wp-content/uploads/2015/12/Eminem-Featured-image-700x420.jpg")
    new_name = "slim shady"
    new_link =  "https://thechive.files.wordpress.com/2014/10/90s-hair-10.jpg?quality=85&strip=info&w=600"

    visit "/artists/#{artist_1.id}"
    click_on "edit"
    fill_in "artist_name", with: new_name
    fill_in "artist_image_path", with: new_link
    click_on "Update Artist"

    expect(page).to have_content(new_name)
    expect(page).to have_css("img[src=\"#{new_link}\"]")
  end
end
