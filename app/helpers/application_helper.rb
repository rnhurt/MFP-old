# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	# Generate the MENU html.
	def menu_builder(page_id)
		content = ''

    ['incidents', 'people', 'vehicles', 'reports'].each do |page|
      content << if page_id == page
        content_tag( :li, link_to(page.humanize, "/#{page}", :class => 'ui-state-default ui-corner-top ui-tabs-selected ui-state-active'))
      else
        content_tag( :li, link_to(page.humanize, "/#{page}", :class => 'ui-state-default ui-corner-top'))
      end
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

end

