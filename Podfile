platform :ios, '13.0'

install! 'cocoapods', :generate_multiple_pod_projects => true

target 'WorkflowPlayground' do
  # use_frameworks!

  pod 'One', path: 'Playgrounds/One/One.podspec'
  pod 'Two', path: 'Playgrounds/Two/Two.podspec'

  pod 'Workflow', git: 'https://github.com/square/workflow.git', branch: 'master'
  pod 'WorkflowUI', git: 'https://github.com/square/workflow.git', branch: 'master'
  pod 'WorkflowSwiftUI', git: 'https://github.com/square/workflow.git', branch: 'master'

end
