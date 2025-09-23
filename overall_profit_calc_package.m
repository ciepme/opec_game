function overall_profit = overall_profit_calc_package(daily)
    % OPEC Country data
    reserves = [130000 45000 50000 35000 35000 45000 27500];
    production_cap = [12000 4600 3700 3300 3000 4400 2700];
    marginal_cost = [6 7 8 6 5 8 8];
    
    %constants
    net_days = 12;
    endgame_bbl = 70;
    interest_rate = 0.05;
    demand_shock = 0;
    supply_shock = 0;
    marginal_cost_roo = mean(marginal_cost(1:end-1));
    marginal_cost_weighted = sum(marginal_cost .* reserves) ./sum(reserves);
    interest_table = net_days:-1:1;
    interest_table = (1+interest_rate).^(interest_table);

    overall_profit = -1 .* overall_profit_calc(daily(1), daily(2), daily(3), daily(4), daily(5), daily(6), daily(7), daily(8), daily(9), daily(10), daily(11), daily(12),...
        marginal_cost_weighted, sum(reserves), endgame_bbl, interest_rate, net_days);
end