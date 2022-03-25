def stock_picker(prices) 
  highest_profit = 0

  for i in 0..prices.length - 2
    for j in i + 1..prices.length - 1
      if prices[j] - prices[i] > highest_profit
        highest_profit = prices[j] - prices[i]
        highest_profit_days = [i, j]
      end
    end
  end
  
  highest_profit_days
end

p stock_picker([17,3,6,9,15,8,6,2,1])
