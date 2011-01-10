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
	Rails.configuration.after_initialize do
		puts "Railx V2.x.y, init_translations_ennder() dans after_initialize"
		init_translations_ennder
	end
else
	puts "Railx V3.x.y, init_translations_ennder()"
	init_translations_ennder
end


module ActionController
	class Base
		# Instance methods here
		def set_locale
			if (params[:locale] and params[:locale].match /^(en|fr)$/)
				I18n.locale = params[:locale]
			elsif session[:locale].nil?
				_http_lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
				if _http_lang.match /^(en|fr)$/
					I18n.locale = _http_lang
				else
					I18n.locale = :fr
				end
			else
				I18n.locale = session[:locale] || :fr
			end

	#		logger.debug "locale=[#{session[:locale]}]"

			if session[:locale] != I18n.locale
				session[:locale] = I18n.locale
			end
		end
	end
end

