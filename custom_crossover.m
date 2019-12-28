% 1-point crossover for TSP
% this crossover assumes that the path representation is used to represent
% TSP tours
%
% Input parameters:
%    OldChrom  - Matrix containing the chromosomes of the old
%                population. Each line corresponds to one individual
%                (in any form, not necessarily real values).
%    PR_Crossover- Probability of recombination occurring between pairs
%                of individuals.
%
% Output parameter:
%    NewChrom  - Matrix containing the chromosomes of the population
%                after mating, ready to be mutated and/or evaluated,
%                in the same format as OldChrom.
%

function NewChrom = custom_crossover(OldChrom, PR_Crossover)

    if nargin < 2, PR_Crossover = NaN; end

    [rows,cols]=size(OldChrom);
    NewChrom = OldChrom;

   row = 1;
   %assumes even nb of chroms
   while row < rows

        % crossover of the two chromosomes
        % results in 2 offsprings
        if rand < PR_Crossover	% recombine with a given probability
            %find crossover index
            index = randi([2 (cols-1)]);

            %split up first chrom at index
            a = NewChrom(row,1:index - 1);
            b = NewChrom(row,index:cols);

            %find remaining cities in second chrom
            s = NewChrom(row + 1,:);

            c = setdiff(s,a,'stable');
            d = setdiff(s,b,'stable'); 

            %add to first
            ac = [a,c];
            bd = [b,d];
            NewChrom(row,:) = ac;
            NewChrom(row+1,:) = bd;

        end

        row = row+2;
   end
   %disp(NewChrom);

end