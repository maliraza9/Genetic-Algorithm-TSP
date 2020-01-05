function NChrom = TournSel(FitnV,NewSel);

TournamentSize = 10;
[Nind,~] = size(FitnV);
NChrom = zeros(NewSel,1);

for i = 1:NewSel
    RandSel = randperm(Nind, TournamentSize);
    best = RandSel(1);
    for j = 2:TournamentSize
        if FitnV(RandSel(j)) <= FitnV(best)
            best = RandSel(j);
        end
    end
    NChrom(i) = best;
end
NChrom = NChrom(randperm(NewSel));
