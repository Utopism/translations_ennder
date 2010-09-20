# Pour que label prenne en compte les formats localisés
module ConversionsWithI18nLabel
	#Constructeur de module
	def self.included(base)
		base.instance_eval do
			alias_method_chain :label, :i18n
		end

		def base.label_with_i18n_bold_and_colon(bold_and_colon, object_name, method, text = nil, options = {})
#			Rails.logger.debug "DEBUG JBA : label_with_i18n(#{object_name}, #{method}, #{text}, #{options})"

			if !text.blank?
				return label_without_i18n(object_name, method, text, options)
			end

			begin
				_label_trans = I18n.t("activerecord.attributes.#{object_name.to_s.tableize.singularize}.#{method}", :raise => true)
			rescue I18n::MissingTranslationData
#				Rails.logger.debug "DEBUG JBA : traduction PAS trouvée(activerecord.attributes.#{object_name.to_s.tableize.singularize}.#{method})"
				_label_trans = method
			end

#			Rails.logger.debug "DEBUG JBA : traduction =[#{_label_trans}]"
			label_without_i18n(object_name, method, (bold_and_colon ? "<b>#{_label_trans}</b> :" : _label_trans), options)
		end

		def base.label_bold_and_colon(object_name, method, text = nil, options = {})
			label_with_i18n_bold_and_colon(true, object_name, method, text, true, options)
		end
	end

	def label_with_i18n(object_name, method, text = nil, options = {})
		label_with_i18n_bold_and_colon(false, object_name, method, text, options)
	end
end