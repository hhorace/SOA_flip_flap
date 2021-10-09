# frozen_string_literal: true

require 'yaml'

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  def take_yaml(yml)
    @data = YAML.safe_load(yml)
  end

  def to_yaml
    # output_string = "---\n"
    # data.each do |person|
    #   person.each_with_index do |(key, val), idx|
    #     output_string += idx.zero? ? "- " : "  "
    #     output_string += key + ": " + format_if_number(val) + "\n"
    #   end
    # end
    # output_string
    data.to_yaml
  end

  # private

  # def format_if_number(val)
  #   val.gsub(' ','').scan(/\D/).empty? ? "'#{val.gsub('\n','')}'" : val.gsub('\n', '')
  # end
end

# 5.1: flog total
# 1.7: flog/method average

# 2.4: YamlBuddy#to_yaml                yaml_buddy.rb:11-20
# 1.6: YamlBuddy#take_yaml              yaml_buddy.rb:7-8
