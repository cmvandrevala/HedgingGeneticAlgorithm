function mutatedGenome = mutateGenome( genome, probability, multiplier )

    mutatedGenome = genome;
    [~, cols] = size(genome);
    
    for i = 1:cols
        n = rand;
        if n <= probability
            mutatedGenome(1,i) = multiplier*mutatedGenome(1,i);
        end
    end


end

