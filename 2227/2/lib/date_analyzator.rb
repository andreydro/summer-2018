# Date Analysis
class DateAnalyzer
  def self.stats_of_rappers(number)
    DataStorage
      .find_names_of_the_rappers
      .each_with_object({}) { |name, hash| hash[name] = RapperAnalyzer.calculate_statistic(name) }
      .sort_by { |_name, stats| stats[:bad_words_count] }.to_a.reverse.first(number.to_i)
  end
end
