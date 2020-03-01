Pod::Spec.new do |s|
  s.name         = 'WorkflowReactNative'
  s.version      = '1.0.0.LOCAL'
  s.summary      = 'React Native and Workflow together'
  s.homepage     = 'https://github.com/bencochran/WorkflowPlayground'
  s.license      = 'Apache License, Version 2.0'
  s.author       = 'Ben Cochran'
  s.source       = { :git => 'https://github.com/github.com/bencochran/WorkflowPlayground.git', :tag => "v#{s.version}" }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.1'

  s.source_files = 'Sources/*.swift'
  s.resource_bundle = {'OneResources' => ['Resources/*']}

  s.dependency 'React'
  s.dependency 'React-Core'
  s.dependency 'Workflow'
  s.dependency 'WorkflowUI'
end
