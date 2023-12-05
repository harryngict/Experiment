Pod::Spec.new do |spec|
  spec.name         = "Experiment"
  spec.version      = "0.0.1"
  spec.summary      = "A Swift library for A/B testing experiments."
  spec.description  = <<-DESC
                       The "Experiment" library is designed to facilitate A/B testing in your iOS application.
                       It provides utilities and functionality to seamlessly integrate and manage A/B experiments,
                       allowing you to test different variations of features and gather valuable insights.
                       DESC
                       
  spec.homepage     = "https://github.com/harryngict/Experiment"
  spec.source       = { :git => "git@github.com:harryngict/Experiment.git", :tag => "#{spec.version}" }
  spec.authors      = { "Hoang Nguyen" => "harryngict@gmail.com" }
  spec.license      = { :type => "MIT", :text => "Copyright (c) 2023" }
  spec.swift_version = '5.0'
  spec.platform     = :ios, "12.0"
  spec.requires_arc = true
  spec.static_framework = true
  spec.source_files  = "Sources/Experiment/**/**/*.{swift}"
end
