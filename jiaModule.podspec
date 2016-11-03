Pod::Spec.new do |s|

s.name         = "HDModule"
s.version      = "1.0.0"
s.summary      = "iOS组件化"

s.homepage     = "https://github.com/zhangdadi/HDModuleDemo"
s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
s.author             = { "zhangdadi" => "z_dadi@163.com" }

s.platform     = :ios, "7.0"

s.source       = { :git => "https://github.com/zhangdadi/HDModuleDemo.git", :tag => "1.0.0" }

s.requires_arc = true

s.subspec 'HDCore' do |HDCore|
jiaCore.source_files = 'HDModule/HDCore/**/*.{h,m}'
jiaCore.dependency 'LKDBHelper'
jiaCore.dependency 'MBProgressHUD'
end