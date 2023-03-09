if @check_in.persisted?
  json.my_form render(partial: 'places/check_ins_form', formats: [:html], locals: {place: @place, check_in: CheckIn.new})
  json.check_in_counter render(partial: 'check_ins/check_ins_count', formats: [:html], locals: {check_ins: @check_ins})
else
  json.my_form render(partial: 'places/check_ins_form', formats: [:html], locals: {place: @place, check_in: @check_in})
end
