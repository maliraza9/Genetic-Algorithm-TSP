% low level function for TSP mutation
% triple exchange : three random cities in a tour are swapped
% Representation is an integer specifying which encoding is used
%	1 : adjacency representation
%	2 : path representation
%

function NewChrom = custom_mutation(OldChrom,Representation)

    NewChrom=OldChrom;

    if Representation==1 
        NewChrom=adj2path(NewChrom);
    end

    % swap three random cities in the tour
    for c = 1:size(NewChrom,1)
        chrom =  NewChrom(c,:);
        
        index1 = randi([1 size(NewChrom,2)]);
        index2 = randi([1 size(NewChrom,2)]);
        index3 = randi([1 size(NewChrom,2)]);

        buffer = chrom(index1);
        chrom(index1) = chrom(index2);
        chrom(index2) = chrom(index3);
        chrom(index3) = buffer;

        NewChrom(c,:) = chrom;
    end


    if Representation==1
        NewChrom=path2adj(NewChrom);
    end
end