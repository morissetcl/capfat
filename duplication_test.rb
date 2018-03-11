require 'rails'
class GetDataFromSpec

  def self.parcours_files
    specs_content = []
    Dir.glob('./spec/features/**/*.rb') do |spec_path|
      spec_file_content = []
      spec_file_content << spec_path unless spec_file_content.include? spec_path # on ajoute le nom du fichier a moins qu'il existe déja dans l'array
      File.foreach(spec_path) do |line|
        spec_file_content << line.strip
      end
      specs_content << spec_file_content
    end
    all_content_from_each_spec_file = specs_content
    return all_content_from_each_spec_file
  end

  def self.recupere_data mot_cle
    all_content_from_each_spec_file = self.parcours_files
    expect = [mot_cle].freeze #mot clé pour choper les expects
    datas = []
    all_content_from_each_spec_file.each do |lines|
      expect_pour_un_fichier = []
      lines.each do |line|
        expect_pour_un_fichier.push(lines.first) unless expect_pour_un_fichier.include? lines.first
        line.split(/\W+/).each do |a|
          if expect.include?(a)
            expect_pour_un_fichier.push(line)
          end
        end
      end
      datas.push(expect_pour_un_fichier)
    end
    datas
  end

  def self.resultat_trie mot_cle
    datas = self.recupere_data mot_cle
    duplications = []
    datas.each do |h|
      array_cool = []
      array_cool << h.first
      h.each do |a|
        array_cool << a.scan(/\([^)]+\)/)
        array_cool.delete_if { |a| a.empty? }
      end
      duplications << array_cool
    end
    resultat_trie = duplications.map { |a| a.flatten }
    resultat_trie.delete_if { |a| a.include?("(page)")}
    resultat_trie.delete_if { |a| a.length == 1 }

    resultat_trie
  end

  p GetDataFromSpec.resultat_trie(ARGV[0])
end
