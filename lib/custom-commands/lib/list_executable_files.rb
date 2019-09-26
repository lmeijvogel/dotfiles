Dir.glob('*').select {|file| FileTest.executable?(file) && File.file?(file) }.each {|file| puts file }
