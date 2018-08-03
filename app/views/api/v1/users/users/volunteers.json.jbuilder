json.users @volunteers do |u|
    if (!current_user.published_volunteers.map(&:user_id).include? u.id)
      json.id u.id
      json.firstname u.firstname
      json.lastname u.lastname
      json.avatar u.avatar
    end
  end



