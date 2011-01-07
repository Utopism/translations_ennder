
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name  'translations_ennder'
  authors  'Ennder'
  email    'mel@ennder.fr'
  url      'http://www.ennder.fr'
}

