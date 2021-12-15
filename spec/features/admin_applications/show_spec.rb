require 'rails_helper'

RSpec.describe 'the admin_applications show' do
  let!(:admin){Admin.create!()}
  let!(:shelter_1){Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)}
  let!(:shelter_2){Shelter.create!(name: 'Lakewood shelter', city: 'Lakewood, CO', foster_program: false, rank: 6)}
  let!(:pet_1){Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter_1.id)}
  let!(:pet_2){Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter_1.id)}
  let!(:application_1){Application.create!(name: 'Frank', street_address: '123 Main St', city: 'Long Beach', state: 'CA', zipcode: '90712', description: '', status: 'Pending')}
  let!(:application_2){Application.create!(name: 'Gary', street_address: '321 Apple St', city: 'Huntington Beach', state: 'CA', zipcode: '90721', description: '', status: 'Pending')}
  let!(:adopt_1){AdoptablePet.create!(pet_id: pet_1.id, application_id: application_1.id)}
  let!(:adopt_2){AdoptablePet.create!(pet_id: pet_1.id, application_id: application_2.id)}

  it 'shows approve buttons for pets on application' do
    visit "/admin/applications/#{application_1.id}"

    expect(page).to have_button("Approve")
  end

  it "shows page after approve is clicked and the button is gone " do
    visit "/admin/applications/#{application_1.id}"

    click_on("Approve")

    expect(page).to have_content("#{pet_1.name} Approved")
    expect(page).to_not have_button("Approve")
  end

  it 'shows reject buttons for pets on application' do
    visit "/admin/applications/#{application_1.id}"

    expect(page).to have_button("Reject")
  end

  it "shows page after reject is clicked and the button is gone " do
    visit "/admin/applications/#{application_1.id}"

    click_on("Reject")

    expect(page).to have_content("#{pet_1.name} Rejected")
    expect(page).to_not have_button("Reject")
    expect(page).to_not have_button("Approve")
  end

  it "Shows that if one pet is accepted on an app it doesn't affect another app with the same pet" do
    visit "/admin/applications/#{application_1.id}"

    click_on("Approve")

    expect(page).to have_content("#{pet_1.name} Approved")
    expect(page).to_not have_button("Approve")

    visit "/admin/applications/#{application_2.id}"

    click_on("Approve")

    expect(page).to have_content("#{pet_1.name} Approved")
    expect(page).to_not have_button("Approve")

  end
end
