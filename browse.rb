require 'rails'
# File.foreach( '/spec/features/artworks/*', '' ) do |line|
#   ok << line
# end

### parcours les fichiers de specs et recupere leur contenu
specs_content = []
Dir.glob('./spec/features/**/*.rb') do |rb_file|
  spec_file_content = []
  spec_file_content << rb_file unless spec_file_content.include? rb_file # on ajoute le nom du fichier a moins qu'il existe déja dans l'array
  File.foreach(rb_file) do |line|
    spec_file_content << line.strip
  end
  specs_content << spec_file_content
end
spec_files = specs_content
expect = ['expect'].freeze #mot clé pour choper les expects
supercool = []
spec_files.each do |lines|
  okcool = []
  lines.each do |line|
    okcool.push(lines.first) unless okcool.include? lines.first
    line.split(/\W+/).each do |a|
      if expect.include?(a)
        okcool.push(line)
      end
    end
  end
  supercool.push(okcool)
end

duplication = []
supercool.each do |h|
  array_cool = []
  array_cool << h.first
  h.each do |a|
    array_cool << a.scan(/\([^)]+\)/)
    array_cool.delete_if { |a| a.empty? }
  end
  duplication << array_cool
end
duplication_flat = duplication.map { |a| a.flatten }
duplication_flat.delete_if { |a| a.include?("(page)")}
duplication_flat.delete_if { |a| a.length == 1 }

# good.each{ |a| a.delete!('()') }
p duplication_flat
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
