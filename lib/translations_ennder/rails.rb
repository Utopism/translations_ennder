# -*- coding: utf-8 -*-

# Méthode possible ici ?
def init_translations_ennder
	I18n.load_path.unshift File.expand_path(File.join(File.dirname(__FILE__), 'locales', 'en.yml'))
	I18n.load_path.unshift File.expand_path(File.join(File.dirname(__FILE__), 'locales', 'fr.yml'))

	#JBA 2010-09-19, sera caduque avec Rails 3
	#pour que to_s prenne en compte les formats localisés
	#  Date.send :include, ConversionsWithI18nToS
	#  Time.send :include, ConversionsWithI18nToS
	ActiveSupport::TimeWithZone.send :include, ConversionsWithI18nToS
	ActionView::Helpers::FormHelper.send :include, ConversionsWithI18nLabel
end


if Rails::VERSION::MAJOR < 3 then
	Rails::Railtie::Configuration.after_initialize do
#	Rails.configuration.after_initialize do
		init_translations_ennder
	end
else
	init_translations_ennder
end
