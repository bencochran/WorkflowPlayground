platform :ios, '13.0'

install! 'cocoapods', :generate_multiple_pod_projects => true

def all_local_pods
  repo_root = __dir__
  %w[Frameworks Playgrounds].each do |dir|
    glob = File.join(dir, '*', '*.podspec')
    Dir[glob, base: repo_root].sort.each do |path|
      spec = Pod::Specification.from_file(File.join(repo_root, path))
      pod spec.name,
        path: path,
        testspecs: spec.test_specs.map(&:base_name),
        appspecs: spec.app_specs.map(&:base_name)
    end
  end
end

target 'WorkflowPlayground' do
  # use_frameworks!

  all_local_pods

  pod 'Workflow', git: 'https://github.com/square/workflow.git', branch: 'master'
  pod 'WorkflowUI', git: 'https://github.com/square/workflow.git', branch: 'master'
  pod 'WorkflowSwiftUI', git: 'https://github.com/square/workflow.git', branch: 'master'

end
