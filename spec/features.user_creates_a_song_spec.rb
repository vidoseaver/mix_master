require 'rails_helper'


RSpec.feature "User submits a new song" do
  scenario "they see the page for the individual song" do
    artist = create(:artist)

    title = "hi, my name is"

    visit artist_path(artist)
    click_on "New song"
    fill_in "song_song_title", with: title
    click_on "Create Song"

    expect(page).to have_content title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
