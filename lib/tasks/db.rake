namespace :db do
  desc "Create local postgres db indicated by DATABASE_URL"
  task :create => :environment do
    url  = URI.parse(ENV["DATABASE_URL"])
    name = url.path[1..-1]

    # connect to the main postgres database
    db = Sequel.connect("postgres://localhost/postgres")
    begin
      db.run(%{CREATE DATABASE "#{name}" ENCODING 'utf8'})
    rescue Sequel::DatabaseError => e
      raise unless e.message =~ /already exists/
    end
  end

  desc "Run database migrations"
  task :migrate, :env do |cmd, args|
    env = args[:env] || "development"
    Rake::Task['environment'].invoke(env)

    require 'sequel/extensions/migration'
    Sequel::Migrator.apply(Sequel::Model.db, "./db/migrate")
    puts "Migrated to the latest"
  end

  desc "Rollback the database"
  task :rollback, :env do |cmd, args|
    env = args[:env] || "development"
    Rake::Task['environment'].invoke(env)

    require 'sequel/extensions/migration'
    Sequel::Migrator.apply(Sequel::Model.db, "./db/migrate", -1)
    puts "Rolled back."
  end

  desc "Nuke the database (drop all tables)"
  task :nuke, :env do |cmd, args|
    env = args[:env] || "development"
    Rake::Task['environment'].invoke(env)
    Sequel::Model.db.tables.each do |table|
      Sequel::Model.db.run("DROP TABLE #{table}")
    end
    puts "Nuked database"
  end

  desc "Reset the database"
  task :reset, [:env] => [:nuke, :migrate]
end
