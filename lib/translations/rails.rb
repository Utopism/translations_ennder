# -*- coding: utf-8 -*-

Rails.configuration.after_initialize do
	I18n.load_path.unshift File.expand_path(File.join(File.dirname(__FILE__), 'locales', 'en.yml'))
	I18n.load_path.unshift File.expand_path(File.join(File.dirname(__FILE__), 'locales', 'fr.yml'))

	#JBA 2010-09-19
	#pour que to_s prenne en compte les formats localisés
	#  Date.send :include, ConversionsWithI18nToS
	#  Time.send :include, ConversionsWithI18nToS
	ActiveSupport::TimeWithZone.send :include, ConversionsWithI18nToS
	ActionView::Helpers::FormBuilder.send :include, ConversionsWithI18nLabel
end
