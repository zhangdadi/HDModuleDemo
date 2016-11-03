Pod::Spec.new do |s|

s.name         = "HDModule"
s.version      = "1.0.0"
s.summary      = "iOS组件化" //简单的描述

s.homepage     = "https://github.com/zhangdadi/HDModuleDemo" //主页
s.license      = { :type => "MIT", :file => "FILE_LICENSE" }  //开源协议
s.author             = { "zhangdadi" => "z_dadi@163.com" }
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/zhangdadi/HDModuleDemo.git", :tag => "1.0.0" }
s.framework = 'UIKit'  //依赖的framework
s.requires_arc = true

s.subspec 'HDCore' do |HDCore|
jiaCore.source_files = 'HDModule/HDCore/**/*.{h,m}'
jiaCore.dependency 'LKDBHelper'
jiaCore.dependency 'MBProgressHUD'
end