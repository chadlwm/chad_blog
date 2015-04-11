class Settings < Fume::Settable::Base
  ruby_provider Rails.root.join('spec/settings.rb') if Rails.env.test?
  ruby_provider Rails.root.join('config/settings.local.rb')
  ruby_provider Rails.root.join('config/settings.rb')
  ruby_provider Rails.root.join('config/pages.rb')

  def self.method_missing(name, *args, &block)
    settings.send(name, *args, &block)
  end
end
