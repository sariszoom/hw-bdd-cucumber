# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
     Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
 regexp = /#{e1}.*#{e2}/m
 page.body.should =~ regexp
  

  end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  my_ratings = rating_list.split
  my_ratings.each do |field|
  if uncheck == "un"
    steps %Q{ When I uncheck "ratings_#{field}"
    }
  else
    steps %Q{ When I check "ratings_#{field}"
    }
  end
end
  
  end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  steps %Q{ Then I should see "The Terminator"}
  steps %Q{ Then I should see "When Harry Met Sally"}
  steps %Q{ Then I should see "Amelie"}
  steps %Q{ Then I should see "The Incredibles"}
  steps %Q{ Then I should see "Raiders of the Lost Ark"}
  steps %Q{ Then I should see "Aladdin"}
  steps %Q{ Then I should see "The Help"}
  steps %Q{ Then I should see "Chocolat"}
  steps %Q{ Then I should see "2001: A Space Odyssey"}
  steps %Q{ Then I should see "Chicken Run"}
  end

When(/^I click the submit button$/) do 
  steps %Q{When I press "ratings_submit"}
end

When(/^I check all of the ratings$/) do
  steps %Q{ When I check "ratings_G"}
  steps %Q{ When I check "ratings_PG"}
  steps %Q{ When I check "ratings_PG-13"}
  steps %Q{ When I check "ratings_R"}
end

Then(/^I should see the following movies:$/) do
  steps %Q{ Then I should see "The Terminator"}
  steps %Q{ Then I should see "When Harry Met Sally"}
  steps %Q{ Then I should see "Amelie"}
  steps %Q{ Then I should see "The Incredibles"}
  steps %Q{ Then I should see "Raiders of the Lost Ark"}
end

Then(/^I should not see the following movies:$/) do
  steps %Q{ Then I should not see "Aladdin"}
  steps %Q{ Then I should not see "The Help"}
  steps %Q{ Then I should not see "Chocolat"}
  steps %Q{ Then I should not see "2001: A Space Odyssey"}
  steps %Q{ Then I should not see "Chicken Run"}
end
