Given /the following movies exist:$/ do |movies_table|
    movies_table.hashes.each do |hash|
        Movie.create!(title: hash['title'], rating: hash['rating'], release_date: hash['release_date'], director: hash['director'])
    end
end

Then /^the director of "(.*)" should be "([^"]*)"$/ do |movie_name, value|
  expect(page).to have_content(movie_name)
  expect(page.body).to match(/Director:\s#{value}/)
end