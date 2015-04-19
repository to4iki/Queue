Pod::Spec.new do |s|
  s.name = "Queue"
  s.version = "0.1.0"
  s.license = "MIT"
  s.summary = "First-In-First-Out (FIFO) Simple Queue"
  s.homepage = "https://github.com/to4iki/Queue"
  s.social_media_url = 'http://twitter.com/to4iki'
  s.author = { "tsk takezawa" => "tsk.take815@gmail.com" }
  s.source  = { :git => "https://github.com/to4iki/Queue.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files  = 'Queue/**/*.swift'

  s.requires_arc = 'true'
end
