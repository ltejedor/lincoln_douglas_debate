module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_num_brackets(division_form_object)
        num_brackets_per_round = []
        for round in division_form_object.object.rounds
          num_brackets_per_round.push(round.brackets.length)
        end
        num_brackets = num_brackets_per_round.max.to_i
  end

  def set_num_rounds(division_form_object)
    division_form_object.object.rounds.length
  end


  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      if association == :rounds
        num_brackets = set_num_brackets(f)
        num_rounds = set_num_rounds(f)
        render(association.to_s.singularize + "_fields", f:builder, num_brackets: num_brackets, num_rounds: num_rounds)
      else
        render(association.to_s.singularize + "_fields", f: builder)
      end
    end
    if association == :rounds
      link_to(name, '#', class: "add_fields_to_table", data: {id: id, fields: fields.gsub("\n", "")})
    else
      link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end
  end

end
