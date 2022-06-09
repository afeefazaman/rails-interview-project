namespace :tenant do
  task reset: :environment do
    Tenant.reset_all
  end
end
