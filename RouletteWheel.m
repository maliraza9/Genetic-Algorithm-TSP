

function NChrom = RouletteWheel(FitnV, NewSel)

    FitnV = FitnV + 0.00001;
    FitnV = 1./FitnV;
    [Nind, ~] = size(FitnV);

    cumfit = cumsum(FitnV);
    NChrom = zeros(NewSel,1);
    for i=1:NewSel
        sel = rand * cumfit(Nind);
        NChrom(i) = find(cumfit == min(cumfit(cumfit > sel)));
    end

    NChrom = NChrom(randperm(NewSel));

end