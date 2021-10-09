# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    people = split_string(tsv)
    @data = []
    colname = []
    people.each_with_index.each do |person, idx|
      if idx.zero?
        colname = get_colname(person)
      else
        @data.push(construct_details(person, colname))
      end
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    output_string = ''
    data.each_with_index.each do |person, idx|
      output_string += formating_tab(person, is_col: true) if idx.zero?
      output_string += formating_tab(person)
    end
    output_string
  end

  private

  def split_string(tsv)
    people = []
    tsb_by_lines = tsv.split("\n")
    tsb_by_lines.each do |lines|
      people.push(lines.split("\t"))
    end
    people
  end

  def get_colname(person)
    person.map do |val|
      val.gsub("\n", '')
    end
  end

  def construct_details(person, colname)
    detail = {}
    person.each_with_index.each do |val, idx|
      detail[colname[idx]] = val.gsub("\n", '')
    end
    detail
  end

  def formating_tab(person, is_col: false)
    row = ''
    person.each_with_index do |val, idx|
      row += is_col ? val[0] : val[1]
      row += idx == person.size - 1 ? '' : "\t"
    end
    row += "\n"
    row
  end
end

# 47.9: flog total
# 6.8: flog/method average

# 14.3: TsvBuddy#formating_tab           tsv_buddy.rb:56-63
# 11.0: TsvBuddy#to_tsv                  tsv_buddy.rb:22-28
# 9.4: TsvBuddy#take_tsv                tsv_buddy.rb:7-15
