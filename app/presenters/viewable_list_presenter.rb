class ViewableListPresenter < BaseListPresenter
  def initialize(list, context, list_key, max)
    super(list, context)
    @max = max
    @list_key = list_key
  end

  def edit_links(method_name = nil)
    return unless h.edit_mode?

    h.content_tag(:ul, sortable(class: "cms-wrapped-edit")) do
      list.each.with_index(1) do |m, i|
        name = method_name ? m.__send__(method_name) : i
        h.concat(h.content_tag(:li, 'data-cms-sortable-id' => m.unique_key.id) do
          m.edit_link(name)
        end)
      end
      h.concat h.content_tag(:li, add_link)
    end
  end

  def add_link
    return unless h.edit_mode?
    return unless @max == Float::INFINITY || list.size < @max.to_i

    h.link_to add_path, class: "cms-add", 'data-no-turbolink' => true do
      h.t('cms.add')
    end
  end

  def sortable(options = {})
    if h.edit_mode?
      { 'data-cms-sortable' => { url: h.main_app.edit_viewable_url }.to_json }.merge(options)
    else
      options
    end
  end

  def sortable_html(options = {})
    sortable(options).to_a.map{ |a| %{#{a.first}=#{a.last}} }.join(' ')
  end

  private

  def add_path
    h.main_app.new_viewable_url list_key: @list_key, max: @max
  end
end
