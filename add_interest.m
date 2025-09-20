function new_valuation = add_interest(profits, rate)
    new_valuation = 0;
    for i = 1:length(profits)
        %assumes profit is counted day after last move
        rated_profit = profits(i) * ((1 + rate)^(length(profits)-i + 1));
        new_valuation = new_valuation + rated_profit;
    end
end