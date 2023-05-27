# frozen_string_literal: true

module CnsValidator
  def self.validate(cns)
    return false if cns.length != 15

    begin_number = cns[0, 1].to_i

    if [1, 2].include?(begin_number)
      begin_number12(cns)
    elsif [7, 8, 9].include?(begin_number)
      begin_number789(cns)
    end
  end

  def self.begin_number12(cns)
    pis = cns[0, 11]

    rest = sum_elements_pis(pis) % 11
    dv = rest.zero? ? 0 : 11 - rest
    result = dv == 10 ? "#{pis}001#{11 - ((soma + 2) % 11)}" : "#{pis}000#{dv}"
    return false unless result == cns

    true
  end

  def self.sum_elements_pis(pis)
    cns_to_array = pis.chars.map(&:to_i)
    cns_to_array.each_with_index.reduce(0) do |sum, (element, index)|
      sum += element * (15 - index)
      sum
    end
  end

  def self.begin_number789(cns)
    cns_to_array = cns.chars.map(&:to_i)
    acumulation = cns_to_array.each_with_index.reduce(0) do |sum, (element, index)|
      sum += element * (15 - index)
      sum
    end

    rest = acumulation % 11
    return false unless rest.zero?

    true
  end
end
