module ApplicationHelper
  def active?(path)
    puts "im the path #{path}"
    'active' if current_page?(path)
  end
end
