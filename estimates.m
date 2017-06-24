clear all
clc

mu = 0.0003;
sigma = 0;
trials = 200;
periods = 30;

iterations = 500;
weights = rand(20,9);

meanFitness = zeros(1,trials);

for i = 1:iterations
    fitnesses = zeros(1,20);
    for j = 1:20
        fitnesses(1,j) = fitness(weights(j,:), trials, periods, mu, sigma);
    end
    newWeights = zeros(20,9);
    meanFitness(1,i) = mean(fitnesses);
    for j = 1:10
        [~,indx] = max(fitnesses);
        newWeights(j,:) = weights(indx,:);
        fitnesses(1,indx) = -100;
    end
    for j = 11:20
        parent1 = newWeights(randi([1,10]),:);
        parent2 = newWeights(randi([1,10]),:);
        newWeights(j,:) = mateGenomes(parent1, parent2, 0.5);
    end
    for j = 1:20
        mutation = mutateGenome(newWeights(j,:), 0.1*i/iterations, 1.1);
        newWeights(j,:) = mutation;
    end
    weights = newWeights;
end

[m,indx] = max(fitnesses);
csvwrite('portfolio.csv', weights(indx,:) / sum(weights(indx,:)))