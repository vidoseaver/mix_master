require 'rails_helper'

RSpec.feature "user views all artits" do
  scenario "they see all the artists in the database" do
    artist_1 = Artist.create(name:"eminem", image_path:"http://gazettereview.com/wp-content/uploads/2015/12/Eminem-Featured-image-700x420.jpg")
    artist_2 = Artist.create(name:"dr dre", image_path: "http://atlantablackstar.com/wp-content/uploads/2015/08/Dr.-Dre-2015.jpg")

    visit "/artists"
    expect(page).to have_content artist_1.name
    expect(page).to have_content artist_2.name
  end
  scenario "the user can click the artist and go to thier show page" do
    artist_1 = Artist.create(name:"eminem", image_path:"http://gazettereview.com/wp-content/uploads/2015/12/Eminem-Featured-image-700x420.jpg")

    visit "/artists"
    click_on "eminem"
    expect(page).to have_content artist_1.name
    expect(page).to have_css("img[src=\"#{artist_1.image_path}\"]")
  end
end
