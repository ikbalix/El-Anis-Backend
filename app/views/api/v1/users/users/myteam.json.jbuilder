

  if current_user.type_u == "hajj"
    json.users @volunteers do |u|
        json.id u.user.id
        json.firstname u.user.firstname
        json.lastname u.user.lastname
        json.avatar u.user.avatar
  
    end
else
    json.users @volunteers do |u|
        json.id u.volunteer.id
        json.firstname u.volunteer.firstname
        json.lastname u.volunteer.lastname
        json.avatar u.volunteer.avatar
    end
end