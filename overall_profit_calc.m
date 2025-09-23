function overall_profit = overall_profit_calc(day_1, day_2, day_3, day_4, day_5, day_6, day_7, day_8, day_9, day_10, day_11, day_12, marginal_cost, reserve, endgame_bbl, interest_rate, net_days)
    %calc constants
    interest_table = net_days:-1:1;
    interest_table = (1+interest_rate).^(interest_table);

    %calc eqs
    %P = @(Q_opec, demand_shock, supply_shock) 101 - (Q_opec./570) - ((demand_shock - supply_shock)./570);
    R = @(Q_opec, demand_shock, supply_shock) Q_opec.*(101 - (Q_opec./570) - ((demand_shock - supply_shock)./570));

    %daily_prod
    daily_prod = [day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12];

    %calc
    production_profit_per_day = R(daily_prod,0,0) - (daily_prod - marginal_cost);
    production_profit_vested = sum(production_profit_per_day .* interest_table);
    leftover_profit = (endgame_bbl - marginal_cost) .* (reserve - sum(daily_prod));
    overall_profit = production_profit_vested + leftover_profit;
end