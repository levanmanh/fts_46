module ApplicationHelper
  def new_fields_template f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    tmpl = f.fields_for(association, new_object,
      child_index: "new_#{association}") do |b|
      render partial: "#{association.to_s.singularize}_fields", locals: {f: b}
    end
    tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, " "
    return "<script> var #{association.to_s}_fields = '#{tmpl.to_s}' </script>"
      .html_safe
  end
end
