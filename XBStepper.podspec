Pod::Spec.new do |s|

  s.name         = "XBStepper"
  s.version      = "1.0"
  s.summary      = "A Number Counter"
  s.homepage     = "https://github.com/JxbSir"
  s.license      = "Peter"
  s.author       = { "Peter" => "i@jxb.name" }
  s.requires_arc = true
  s.source       = { :git => "https://github.com/JxbSir/XBStepper.git"  }
  s.source_files = "XBStepper/XBStepper/*.{h,m}"
  s.public_header_files = 'XBStepper/XBStepper/XBStepper.h'

end
