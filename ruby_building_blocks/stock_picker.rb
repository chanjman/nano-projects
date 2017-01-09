def stock_picker(stock_prices)
  spread = stock_prices.combination(2)
                       .select { |first, last| last > first }
                       .max_by { |first, last| last - first }

  p "For biggest profit, buy at $#{spread[0]} and sell at $#{spread[1]}"
end
