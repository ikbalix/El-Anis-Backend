require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Recipes
  class Application < Rails::Application
    
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => "testmailing466@gmail.com",
    :password             => "foobarazerty123",
    :authentication       => "plain",
    :enable_starttls_auto => true
    }

    config.i18n.default_locale = :fr

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          methods: [:get, :post, :delete, :put, :patch, :options, :head],
          expose:  ['Total', 'Per-Page', 'Current-page','access-token', 'expiry', 'token-type', 'uid', 'client'],
          max_age: 1728000
      end
    end  

    ApiPagination.configure do |config|
      config.paginator = :kaminari # or :will_paginate
      config.page_header = 'Current-page'
    end

  end
end