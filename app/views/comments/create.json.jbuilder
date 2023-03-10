if @comment.persisted?
  json.myform render(partial: "places/comment_form", formats: [:html], locals: { place: @place, comment: Comment.new })
  json.inserted_item render(partial: "places/display_comments", formats: [:html], locals: { comment: @comment })
else
  json.myform render(partial: "places/comment_form", formats: :html, locals: { place: @place, comment: @comment })
end
