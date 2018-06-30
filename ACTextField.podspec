#
# Be sure to run `pod lib lint ACTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ACTextField'
  s.version          = '1.0.0'
  s.summary          = 'UITextField Subclass which have auto completed text feature'


# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Using this library you can set your textfield class to ACTextField , which enable AutoComplete Feature in your textField.
Today Auto Completion feature is one of most important features. So using ACTextField use can have AutoCompletion feature in your app.
ACTextField have a method 'setAutoCompleteWith', in which you have to pass Array of String type, this array is considered as data source of your AutoCompletion feature.
ACTextField have a strict mode which you can enable or disable , by default it is disabled. Using strict mode you can tell to auto capitalise first letter of text you are writing in textfield.
If you want to implement 'func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool' delagate method of textField then you can implement ACTextFieldDelegate
You can set 'suggestionTextColor' ,a property of ACTextField  ,using this property you can set color of suggestion string. You can set 'suggestionTextColor' from Storyboard also.

                       DESC

  s.homepage         = 'https://github.com/varkrishna/ACTextField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'varkrishna' => 'krishan.varshney708@gmail.com' }
  s.source           = { :git => 'https://github.com/varkrishna/ACTextField.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'ACTextField/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ACTextField' => ['ACTextField/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
end
