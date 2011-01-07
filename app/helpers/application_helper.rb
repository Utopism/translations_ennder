# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	#Label de la forme : "<b><nom_colonne></b>: "
	def label_bold_and_colon(object_name, method, text = nil, options = {})
		Rails.logger.debug "DEBUG JBA : #{self.class.name}.label_bold_and_colon(#{object_name}, #{method}, #{text}, #{options})"
		if text.blank?
			label(true, object_name, method, method.humanize, true, options)
		else
			label(true, object_name, method, "<b>#{text}</b> :", true, options)
		end
	end
end
