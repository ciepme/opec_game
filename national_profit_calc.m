function national_profit = national_profit_calc(daily_prod, daily_price, marginal_cost, reserve, endgame_bbl, interest_rate)
    production_profit_per_day = sum(daily_prod .* (daily_price-marginal_cost));
    production_profit = sum(production_profit_per_day) ./ interest_rate;
    leftover_profit = endgame_bbl .* (reserve - sum(daily_prod));
    national_profit = production_profit + leftover_profit;
end