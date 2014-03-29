module ApplicationHelper

  # http://stackoverflow.com/questions/8516302/remove-fields-add-field-link-not-working-on-nested-form-in-rails-3-0-9
	def link_to_remove_fields(name, f)
    # crea un campo oculto llamado _destroy para que rails borre el modelo
    # y crea un enlace, que llama al js que lo pone a true y esconde el campo
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
  
    # magia turbia de rails para pintar lo mismo que el fields_for y guardarlo como string
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    # pinta un enlace a una funcion js pasandole, el nombre del has_many, y el texto de los campos
    #association = line_items ahora, pero lo ponemos asi para poder pasarle en el futuro otros campos
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
end
