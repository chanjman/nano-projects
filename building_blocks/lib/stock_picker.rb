def stock_picker(stock_prices)
  return 'You need more than one stock price!' if stock_prices.empty? or stock_prices.size.eql? 1
  spread = stock_prices.combination(2)
                       .select { |first, last| last > first }
                       .max_by { |first, last| last - first }
  return 'You cannot make profit in bearish market.' if spread.nil?
  p "For biggest profit, buy at $#{spread[0]} and sell at $#{spread[1]}"
end
