class ViewablePresenter < BasePresenter
  def edit_link(name = nil)
    return unless h.edit_mode?

    h.link_to edit_path, class: "cms-edit cms-edit-#{m.dashed_name}", 'data-no-turbolink' => true do
      "#{h.t('cms.edit')} #{name}"
    end
  end

  private

  def edit_path
    h.rails_admin.edit_path(model_name: m.class.name.underscore.gsub('/', '~'), id: m.id)
  end
end