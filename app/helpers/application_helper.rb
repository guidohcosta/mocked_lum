module ApplicationHelper
  def full_title(title)
    base_title = "Mocked Lumi.ne"
    base_title += " | #{title}" unless title.empty?
    base_title
  end
end
