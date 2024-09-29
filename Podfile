# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Aiquefome' do
  use_frameworks!

  # Pods for Aiquefome
  flutter_application_path = '../ai_que_fome_flutter'
  load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
  install_all_flutter_pods(flutter_application_path)

end

post_install do |installer|
  flutter_post_install(installer) if defined?(flutter_post_install)
end