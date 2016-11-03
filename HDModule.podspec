Pod::Spec.new do |s|
s.name     = 'HDModule'
s.version  = '1.0.1'
s.license  = 'MIT' #开源协议
s.summary  = 'iOS组件化' #简单的描述
s.homepage = 'https://github.com/zhangdadi/HDModuleDemo' #主页
s.author   = { 'zhangdadi' => 'z_dadi@163.com' } #作者
s.source   = { :git => 'https://github.com/zhangdadi/HDModuleDemo.git', :tag => s.version } #git路径、指定tag号
s.platform = :ios, "7.0"
s.framework = 'UIKit'  #依赖的framework
s.requires_arc = true

  s.subspec 'HDCore' do |ss|
    ss.source_files = 'HDModule/HDCore/**/*'
    ss.dependency 'LKDBHelper'
    ss.dependency 'MBProgressHUD'
  end

end
