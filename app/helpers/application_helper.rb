# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	# Generate the MENU html.
	def menu_builder(page_id)
		content = ''

    ['incidents', 'people', 'vehicles', 'properties', 'reports', 'admin'].each do |page|
      # Set the class depending on which page we are one
      link_class = 'ui-state-default ui-corner-top'                         # Non-current page
      link_class << ' ui-tabs-selected ui-state-active' if page_id == page  # Current page
      link_class << ' ui-state-error' if page == 'admin'                    # Restricted page

      content << content_tag( :li, link_to(page.humanize, "/#{page}"), :class => link_class )
    end

    return content
  end

  
  # Show the FLASH div if there is data in the flash object.
  def show_flash
    result = ''
    flash.each {|type, message| result << content_tag(:div, message, :id => 'flash',
        :class => "#{type.to_s} ui-state-highlight ui-corner-all") }
    return result
  end

  # Dynamically insert Javascript into the document
  def javascript(*files)
    content_for(:footer) { javascript_include_tag(*files)}
  end
end

