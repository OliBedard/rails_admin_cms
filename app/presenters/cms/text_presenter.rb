class CMS::TextPresenter < CMS::ElementPresenter
  def html
    m.text.try(:html_safe)
  end

  def text
    h.strip_tags m.text
  end
end