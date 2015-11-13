#!/usr/bin/env ruby

file = File.open './input.txt'

content = file.read

words = content.split # string to array; split on space

words.each do |word|
  # get index of first punctuation
  punc = word.index(/[[:punct:]]/) 

  if punc.nil?
    # offset by 2 because:
    # 0 based index (-1)
    # dont include last letter (-1)
    scramble_range = 1..(word.length - 2)
  else
    # offset by 2 because:
    # dont include punc (-1)
    # dont include last letter (-1)
    scramble_range = 1..(punc - 2)
  end

  # need at least 2 characters to scramble
  if scramble_range.include? 2 
    # slice range from string
    # split string to array
    # shuffle array
    # join array to string
    # replace chars in word
    word[scramble_range] = word.slice(scramble_range).split('').shuffle.join('')
  end 
end

content = words.join(' ') # array to string; delimit by space

puts content

