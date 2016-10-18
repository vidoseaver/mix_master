require "spec_helper"

RSpec.feature "user can delete an artist" do
  scenario "user goes to the show page and deletes the artist then goes to the index which will not have"
    artist_1 = Artist.create(name:"eminem", image_path:"http://gazettereview.com/wp-content/uploads/2015/12/Eminem-Featured-image-700x420.jpg")

    visit "/artist/#{artist_1.id}"
    click_on "remove artist"

    expect(page).to_not have_content(artist_1.name)
  end
end
