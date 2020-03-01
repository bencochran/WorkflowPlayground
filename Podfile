platform :ios, '13.0'

use_modular_headers!
install! 'cocoapods', :generate_multiple_pod_projects => true
use_frameworks!(linkage: :static)

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

def react_native_pod(name, path: nil, **kwargs)
  full_path = "./node_modules/react-native"
  if path
    full_path << "/#{path}"
  end
  full_path << "/#{name.split('/').first}.podspec"
  pod name,
    path: full_path,
    **kwargs
end

target 'WorkflowPlayground' do
  all_local_pods

  pod 'Workflow', git: 'https://github.com/square/workflow.git', branch: 'master'
  pod 'WorkflowUI', git: 'https://github.com/square/workflow.git', branch: 'master'
  pod 'WorkflowSwiftUI', git: 'https://github.com/square/workflow.git', branch: 'master'

  react_native_pod 'React'
  react_native_pod 'React-Core'
  react_native_pod 'React-cxxreact', :path => 'ReactCommon/cxxreact'
  react_native_pod 'React-jsi', :path => 'ReactCommon/jsi'
  react_native_pod 'React-jsiexecutor', :path => 'ReactCommon/jsiexecutor'
  react_native_pod 'React-jsinspector', :path => 'ReactCommon/jsinspector'
  react_native_pod 'React-RCTActionSheet', :path => 'Libraries/ActionSheetIOS'
  react_native_pod 'React-RCTAnimation', :path => 'Libraries/NativeAnimation'
  react_native_pod 'React-RCTBlob', :path => 'Libraries/Blob'
  react_native_pod 'React-RCTImage', :path => 'Libraries/Image'
  react_native_pod 'React-RCTLinking', :path => 'Libraries/LinkingIOS'
  react_native_pod 'React-RCTNetwork', :path => 'Libraries/Network'
  react_native_pod 'React-RCTSettings', :path => 'Libraries/Settings'
  react_native_pod 'React-RCTText', :path => 'Libraries/Text'
  react_native_pod 'React-RCTVibration', :path => 'Libraries/Vibration'
  react_native_pod 'Yoga', :path => 'ReactCommon/yoga'
  react_native_pod 'React-CoreModules', :path => 'React/CoreModules'
  react_native_pod 'FBReactNativeSpec', :path => 'Libraries/FBReactNativeSpec'
  react_native_pod 'RCTRequired', :path => 'Libraries/RCTRequired'
  react_native_pod 'RCTTypeSafety', :path => 'Libraries/TypeSafety'
  react_native_pod 'FBLazyVector', :path => 'Libraries/FBLazyVector'
  react_native_pod 'ReactCommon/turbomodule/core', :path => 'ReactCommon'

  pod 'DoubleConversion', :podspec => './node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
  pod 'Folly', :podspec => './node_modules/react-native/third-party-podspecs/Folly.podspec'
  pod 'glog', :podspec => './node_modules/react-native/third-party-podspecs/glog.podspec'
end
