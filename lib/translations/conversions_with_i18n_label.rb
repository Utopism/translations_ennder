# Pour que label prenne en compte les formats localisés
module ConversionsWithI18nLabel
	def self.included(base)
		base.instance_eval do
			alias_method_chain :label, :i18n
		end
	end

	def label_with_i18n(object_name, method, text = nil, options = {})
#		Rails.logger.debug "DEBUG JBA : label_with_i18n(#{object_name}, #{method}, #{text}, #{options})"

		if !text.blank?
			return label_without_i18n(object_name, method, text, options)
		end

		begin
			_text_trans = I18n.t("activerecord.attributes.#{object_name.to_s.tableize.singularize}.#{method}", :raise => true)
		rescue I18n::MissingTranslationData
#			Rails.logger.debug "DEBUG JBA : traduction PAS trouvée(activerecord.attributes.#{object_name.to_s.tableize.singularize}.#{method})"
			return label_without_i18n(object_name, method, self.bold_and_colon(method), options)
		end

#		Rails.logger.debug "DEBUG JBA : traduction =[#{_text_trans}]"
		label_without_i18n(object_name, method, self.bold_and_colon(_text_trans), options)
	end

private
	def bold_and_colon(p_string)
		"<b>#{p_string}</b> :"
	end
end
