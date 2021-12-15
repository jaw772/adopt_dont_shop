require 'rails_helper'

RSpec.describe 'the admin_shelter index' do
  let!(:admin){Admin.create!()}
  let!(:shelter_1){Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)}
  let!(:shelter_2){Shelter.create!(name: 'Lakewood shelter', city: 'Lakewood, CO', foster_program: false, rank: 6)}
  let!(:pet_1){Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter_1.id)}
  let!(:pet_2){Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter_1.id)}
  let!(:application_1){Application.create!(name: 'Frank', street_address: '123 Main St', city: 'Long Beach', state: 'CA', zipcode: '90712', description: '', status: 'Pending')}
  let!(:application_2){Application.create!(name: 'Gary', street_address: '321 Apple St', city: 'Huntington Beach', state: 'CA', zipcode: '90721', description: '', status: 'In Progress')}
  let!(:adopt){AdoptablePet.create!(pet_id: pet_1.id, application_id: application_1.id)}
  it 'lists all the shelters in reverse alphabetical order' do
    visit '/admin/shelters'

    expect("Lakewood shelter").to appear_before("Aurora shelter")
  end

  it "lists all the pending applications within the shelters" do
    visit "/admin/shelters"

    expect("Aurora shelter").to appear_before("Frank")
    expect(page).to_not have_content("Gary")
  end
end
