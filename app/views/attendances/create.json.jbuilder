if @attendance.persisted?
  json.my_form render(partial: 'events/attendance_form', formats: [:html], locals: {event: @event, attendance: Attendance.new})
  json.public_attendees render(partial: 'events/public_attendees', formats: [:html], locals: {attendances: @attendances})
else
  json.my_form render(partial: 'events/attendance_form', formats: [:html], locals: {event: @event, attendance: @attendance})
end
