Pod::Spec.new do |s|
  s.name         = "QLLoginModel"
  s.version      = "0.0.1"
  s.summary      = "QLLoginModel登录模块"

  s.homepage     = "https://github.com/aliang124/QLLoginModel"

  s.license      = "MIT"
  s.author             = { "jienliang000" => "jienliang000@126.com" }

  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/aliang124/QLLoginModel.git", :tag => "#{s.version}" }
  s.source_files  = "QLLoginModel/*.{h,m}"

  s.subspec 'View' do |ss|
  ss.source_files = 'QLLoginModel/View/**/*.{h,m,c,mm}'
  end

  s.subspec 'Util' do |ss|
  ss.source_files = 'QLLoginModel/Util/**/*.{h,m,c,mm}'
  end

  s.subspec 'NetWorking' do |ss|
  ss.source_files = 'QLLoginModel/NetWorking/**/*.{h,m,c,mm}'
  end

  s.subspec 'Controller' do |ss|
  ss.source_files = 'QLLoginModel/Controller/**/*.{h,m,c,mm}'
  end

end
