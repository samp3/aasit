
When(/^Käyttäjä siirtyy sivulle refs$/) do
  visit '/refs.json'
  page.should have_content("1")
end
Then(/^hän näkee listan järjestelmässä olevista viitteistä$/) do
  pending # Write code here that turns the phrase above into concrete actions
end