require 'rails_helper'

describe "User Visits Homepage" do
  it "sees a list of flights" do
    visit '/'

    expect(page).to have_text("Flights")
  end
end
