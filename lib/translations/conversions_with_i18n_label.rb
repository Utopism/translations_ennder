# Pour que label prenne en compte les formats localisés
module ConversionsWithI18nLabel
	def self.included(base)
		base.instance_eval do
			alias_method_chain :label, :i18n
		end
	end

	def label_with_i18n(object_name, method, text = nil, options = {})
		if !text.blank?
			return label_without_i18n(object_name, method, text, options)
		end

		begin
			_text_trans = I18n.t("activerecod.attributes.#{object_name}.#{method}", :raise => true)
		rescue I18n::MissingTranslationData
			Rails.logger.debug "DEBUG JBA : traduction PAS trouvée(#{object_name}/#{method}"
			return label_without_i18n(object_name, method, text, options)
		end

		label_without_i18n(object_name, method, _text_trans, options)
	end
end
