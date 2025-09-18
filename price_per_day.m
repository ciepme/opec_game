function price = price_per_day(P, opec_production, demand_shock, supply_shock)
    price = P(sum(opec_production),demand_shock, supply_shock);
end