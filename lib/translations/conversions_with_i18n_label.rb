# Pour que label prenne en compte les formats localisés
module ConversionsWithI18nLabel
	#Constructeur de module
	def self.included(base)
		base.instance_eval do
#			puts "#{base.name}.instance_eval"
			alias_method_chain :label, :i18n
		end

	end

	def label_with_i18n(object_name, method, text = nil, options = {})
		Rails.logger.debug "DEBUG JBA : #{self.class.name}.label_with_i18n(#{object_name}, #{method}, #{text}, #{options})"

		if !text.blank?
			#PAS de changement du comportement si un libellé a été fournir
			return label_without_i18n(object_name, method, text, options)
		end

		begin
			_label_trans = I18n.t("activerecord.attributes.#{object_name.to_s.tableize.singularize}.#{method}", :raise => true)
		rescue I18n::MissingTranslationData
#			Rails.logger.debug "DEBUG JBA : traduction PAS trouvée(activerecord.attributes.#{object_name.to_s.tableize.singularize}.#{method})"
			#PAS de changement du comportement si aucune traduction trouvée
			_label_trans = text
		end

#		Rails.logger.debug "DEBUG JBA : traduction =[#{_label_trans}]"
		label_without_i18n(object_name, method, _label_trans, options)
	end
end