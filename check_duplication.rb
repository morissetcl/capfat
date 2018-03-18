require 'rails'
require 'colorize'
require_relative 'check_expect'

class CheckDuplication
  class << self
    def recupere_data_from_spec(arg)
      datas = GetDataFromSpec.resultat_trie(arg)
      trie_les_expects_et_les_noms_de_fichiers(datas)
      identifie_duplication_au_sein_d_un_mm_file(datas)
    end

    def trie_les_expects_et_les_noms_de_fichiers(datas)
      @array_filename = []
      datas.each do |a|
        @array_filename << a.first
        a.shift
      end
    end

    def identifie_duplication_au_sein_d_un_mm_file(datas)
      duplication_final = []
      datas.each do |data|
        duplication = []
        data.each{ |expect| duplication << expect.scan(/^([^.]+)/).flatten }
        duplication_final << duplication.flatten
      end
      formate_les_resultats_par_fichier(duplication_final)
    end

    def formate_les_resultats_par_fichier(duplication_final)
      array_reconstitue = @array_filename.zip(duplication_final)
      affiche_les_resultats_par_fichier(array_reconstitue)
      affiche_les_resultats_pour_ensemble_des_specs(array_reconstitue)
    end

    private

    def affiche_les_resultats_par_fichier(arr_trie)
      puts ' ----- Analyze of your expects by files -----'
      display_result = []
      arr_trie.each do |a|
        hash_count = a.last.inject(Hash.new(0)) {|h,i| h[i] += 1; h }
        hash_count.to_a.map { |expect_name,count| display_result <<  [a.first, expect_name, count] }
        print ".".colorize(color: COLORS.sample)
        sleep(0.2)
      end
      puts "\n\n"
      display_result_triee = display_result.sort_by(&:last).reverse
      display_result_triee.each { |a| puts "in #{a.first.green}: you use #{a[2].to_s.light_red} times as #{a[1].light_red}"}
    end

    def affiche_les_resultats_pour_ensemble_des_specs(arr_trie)
      puts "\n\n"
      puts ' ----- Analyze of your expects from all yours specs -----'
      global_array = arr_trie.flatten.flatten
      global_hash =  global_array.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
      global_hash.delete_if { |k, v| v <= 1 }
      global_array_trie = global_hash.sort_by(&:first).reverse
      global_array_trie.map { |expect_name,count| puts "You use #{count.to_s.light_red} times the '#{expect_name.light_red}' expect" }
    end
  end
end

COLORS = [:light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan]

CheckDuplication.recupere_data_from_spec(ARGV[0])
