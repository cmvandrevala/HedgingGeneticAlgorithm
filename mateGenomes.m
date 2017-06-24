function child = mateGenomes(parent1, parent2, probability)

    [~, cols] = size(parent1);
    child = zeros(1,cols);
    
    for i = 1:cols
        n = rand;
        if n <= probability
            child(1,i) = parent1(1,i);
        else
            child(1,i) = parent2(1,i);
        end
    end

end

