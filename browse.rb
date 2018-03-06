require 'rails'
# File.foreach( '/spec/features/artworks/*', '' ) do |line|
#   ok << line
# end

### parcours les fichiers de specs et recupere leur contenu
specs_content = []
Dir.glob('./spec/features/**/*.rb') do |rb_file|
  spec_file_content = []
  spec_file_content << rb_file unless spec_file_content.include? rb_file
  File.foreach(rb_file) do |line|
    spec_file_content << line.strip
  end
  specs_content << spec_file_content
end
spec_files = specs_content
expect = ['expect'].freeze #mot clé pour choper les expects
supercool = []

spec_files.each do |lines|
  lines.each do |line|
    line.split(/\W+/).each do |a|
      if expect.include?(a)
        supercool.push(line)
      end
    end
  end
end
duplication = []
supercool.each do |h|
  duplication << h.scan(/\([^)]+\)/)
end
good = duplication.flatten.delete_if { |a| a == "(page)"}
p good
#######

####### récupere les models de l'app########
Dir.glob('app/models/*.rb') do |rb_file|
  model = rb_file.scan(/[^\/]*$/).first.chomp('.rb')
  model.classify
end
#####################


# m = 'coucou'
# p m.split.map(&:capitalize).join(' ')
# Dir.glob('./spec/features/**/*.rb') do |rb_file|
#   File.open(rb_file) do |file|
#     ok << file.read
#   end
# end
