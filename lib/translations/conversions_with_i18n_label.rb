# Pour que label prenne en compte les formats localisés
module ConversionsWithI18nLabel
	def self.included(base)
		base.instance_eval do
			alias_method_chain :label, :i18n
		end
	end

	def label_with_i18n(method, text = nil, options = {})
		Rails.logger.debug "DEBUG JBA : label_with_i18n(#{method}, #{text}, #{options})"

		if !text.blank?
			return label_without_i18n(method, text, options)
		end

		begin
			_text_trans = I18n.t("activerecord.attributes.#{self.object.class.name.tableize.singularize}.#{method}", :raise => true)
		rescue I18n::MissingTranslationData
			Rails.logger.debug "DEBUG JBA : traduction PAS trouvée(activerecord.attributes.#{self.object.class.name.tableize.singularize}.#{method})"
			return label_without_i18n(method, text, options)
		end

		Rails.logger.debug "DEBUG JBA : traduction =[#{_text_trans}]"
		label_without_i18n(method, _text_trans, options)
	end
end
