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

	########################################################
	# Recherche et M-À-J la locale						   #
	# depuis les params de requête, la session, la requête #
	# JBA 2010-09-07									   #
	########################################################
	def set_locale
		if (params[:locale] and params[:locale].match /^(en|fr)$/)
			I18n.locale = params[:locale]
		elsif session[:locale].nil?
			if request.env['HTTP_ACCEPT_LANGUAGE'].blank?
				#2011-01-05 Vérif° supplémentaire
				_http_lang = ''
			else
				_http_lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
			end

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
