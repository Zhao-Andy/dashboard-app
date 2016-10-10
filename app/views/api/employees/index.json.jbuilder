json.array! @employees.each do |employee|
  json.id employee.id
  json.first_name employee.first_name
  json.last_name employee.last_name
  json.email employee.email
  json.hiring_date employee.hiring_date
end
