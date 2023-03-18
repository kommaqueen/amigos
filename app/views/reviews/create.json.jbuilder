if @review.persisted?
  json.form render(partial: "places/review_form", formats: [:html], locals: {place: @place, review: Review.new})
  json.inserted_item render(partial: "places/display_reviews", formats: [:html], locals: {r: @review})
else
  json.form render(partial: "places/review_form", formats: [:html], locals: {place: @place, review: @review})
end
