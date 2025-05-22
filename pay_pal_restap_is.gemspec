Gem::Specification.new do |s|
  s.name = 'test-sdk'
  s.version = '1.3.8'
  s.summary = 'test'
  s.description = 'test'
  s.authors = ['test']
  s.email = ['tahaali2000@hotmail.com']
  s.homepage = 'https://app.dev.apimatic.io/Account/Login?ReturnUrl=%2Fdashboard'
  s.licenses = ['MIT']
  s.metadata  = {
}

  s.add_dependency('apimatic_core_interfaces', '~> 0.2.1')
  s.add_dependency('apimatic_core', '~> 0.3.11')
  s.add_dependency('apimatic_faraday_client_adapter', '~> 0.1.4')
  s.required_ruby_version = ['>= 2.6']
  s.files = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
end
