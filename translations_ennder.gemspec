Gem::Specification.new do |s|
  s.name        = 'translations_ennder'
  s.version     = '1.1.8'
  s.date        = '2018-04-28'
  s.summary     = "Apporte des traductions standard en Français et Anglais -- Brings translations in French and English."
  s.description = "Apporte des traductions Françaises et Anglaises. Permet la traduction automatique des labels pour Rails 2 et Rails 3+"
  s.authors     = ["Ennder"]
  s.email       = 'mel+rails@ennder.fr'

  s.files       = [
    'Changelog',
    'MIT-LICENSE',
    'README.md',
    'Rakefile', # Add tests
    'TODO',
  ]
  s.files += Dir['app/**/*']
  s.files += Dir['config/**/*']
  s.files += Dir['db/**/*']
  s.files += Dir['lib/**/*']
  s.files += Dir['test/**/*']

  s.homepage    = 'https://github.com/ennder/translations_ennder'
  s.license     = 'MIT'
end
