module Admin
  module Form
    module Row
      extend ActiveSupport::Concern

      included do
        rails_admin do
          object_label_method do
            :id
          end

          configure :structure do
            read_only true
            pretty_value do
              h = bindings[:view]
              p = ViewablePresenter.new value, h
              h.link_to value.name, p.__send__(:edit_path)
            end
          end

          edit do
            exclude_fields :fields, :viewable
          end

          list do
            configure :id do
              sort_reverse false
            end

            scopes ::Form::Structure.scopes
          end
        end
      end
    end
  end
end
