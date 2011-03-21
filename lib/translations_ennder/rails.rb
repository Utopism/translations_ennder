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
		Rails.debugger.info "gem translations_ennder V#{TranslationsEnnder.version}, Railx V2.x.y, init_translations_ennder() dans after_initialize"
		init_translations_ennder
	end
else
	Rails.debugger.info "gem translations_ennder V#{TranslationsEnnder.version}, Railx V3.x.y, init_translations_ennder()"
	init_translations_ennder
end


module ActionController
	class Base
		# Instance methods here

		def set_locale
			_param_locale = params[:locale]
			if (!_param_locale.blank?) and _param_locale.match /^(en|fr)$/)
				#Vient du paramètre de requête
				I18n.locale = _param_locale
			elsif session[:locale].blank? and (! request.env['HTTP_ACCEPT_LANGUAGE'].blank?)
				#Vient des entêtes de la requête
				_http_lang_tab = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/)
				if (! _http_lang_tab.empty?) and (! _http_lang.first.blank? )
					if _http_lang.first.match /^(en|fr)$/
						I18n.locale = _http_lang.first
					else
						set_locale_session_or_fr
					end
				else
					set_locale_session_or_fr
				end
			else
				set_locale_session_or_fr
			end

#			logger.debug "locale=[#{session[:locale]}]"

			if session[:locale] != I18n.locale
				session[:locale] = I18n.locale
			end
		end

		def set_locale_session_or_fr
			#Vient de la session, ou pas fourni
			I18n.locale = session[:locale] || :fr
		end
	end
end

