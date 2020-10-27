require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
 use UsersContoller
 use CategoriesController
 use ArtSupplesController
 use Rack::MethodOverride
