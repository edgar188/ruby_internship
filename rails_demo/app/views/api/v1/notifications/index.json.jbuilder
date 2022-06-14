json.array! @notifications[:result] do |notification|
  json.extract! notification, :id, :notice_type, :notice_message
end