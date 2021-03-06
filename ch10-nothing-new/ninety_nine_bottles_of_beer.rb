def english_number number
  return 'Please enter a number that isn\'t negative.' if number < 0  # No negative numbers.
  return 'zero'                                        if number == 0

  numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']
  bzillions = [['hundred', 2], ['thousand', 3], ['million', 6], ['billion', 9], ['trillion', 12],
               ['quadrillion', 15], ['quintillion', 18], ['sextillion', 21]]

left  = number

  while bzillions.length > 0
    pair = bzillions.pop
    name = pair[0]
    base = 10 ** pair[1]
    write = left / base
    left = left - write * base

    if write > 0
      pre = english_number(write)
      numString << pre + " " + name
      numString << " " if left > 0
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      numString = numString + teenagers[left-1]
      left = 0

    else numString = numString + tensPlace[write-1] end

    numString = numString + '-' if left > 0
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  numString = numString + onesPlace[write-1] if write > 0

  numString
end

num_at_start = 99 # change to 9999 if you want
num_now = num_at_start
while num_now > 2
  puts english_number(num_now).capitalize + ' bottles of beer on the wall, ' +
    english_number(num_now) + ' bottles of beer!'
  num_now = num_now - 1
  puts 'Take one down, pass it around, ' +
    english_number(num_now) + ' bottles of beer on the wall!'
end
