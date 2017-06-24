function fit = fitness( genome, trials, periods, mu, sigma )

    final_values = zeros(1,trials);
    
    InverseETFMinusFour = genome(1,1);
    InverseETFMinusThree = genome(1,2);
    InverseETFMinusTwo = genome(1,3);
    InverseETF = genome(1,4);
    LiquidCash = genome(1,5);
    IndexFund = genome(1,6);
    IndexFundPlusTwo = genome(1,7);
    IndexFundPlusThree = genome(1,8);
    IndexFundPlusFour = genome(1,9);
    
    for i = 1:trials
        for j = 1:periods
            r = normrnd(mu,sigma);
            InverseETFMinusFour = InverseETFMinusFour*(1 - 4*r);
            InverseETFMinusThree = InverseETFMinusThree*(1 - 3*r);
            InverseETFMinusTwo = InverseETFMinusTwo*(1 - 2*r);
            InverseETF = InverseETF*(1 - r);
            IndexFund = IndexFund*(1 + r);
            IndexFundPlusTwo = IndexFundPlusTwo*(1 + 2*r);
            IndexFundPlusThree = IndexFundPlusThree*(1 + 3*r);
            IndexFundPlusFour = IndexFundPlusFour*(1 + 4*r);
        end
        ending_balance = InverseETFMinusFour + InverseETFMinusThree + InverseETFMinusTwo + InverseETF + LiquidCash + IndexFund + IndexFundPlusTwo + IndexFundPlusThree + IndexFundPlusFour;
        final_values(1,i) = ending_balance / sum(genome);
    end
    
    fit = mean(final_values);
end

