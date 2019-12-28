%
% ObjVal = tspfun(Phen, Dist)
% Implementation of the TSP fitness function
%	Phen contains the phenocode of the matrix coded in adjacency
%	representation
%	Dist is the matrix with precalculated distances between each pair of cities
%	ObjVal is a vector with the fitness values for each candidate tour (=each row of Phen)
%

function ObjVal = tspfun(Phen, Dist);
    %PhenAdj = path2adj(Phen);
    max = size(Phen,2);
    
%     %Checkvalues
%     col = round(Phen(:,1));
%     for i = 1:size(col)
%         if col(i)<1
%             col(i) = 1;
%         elseif col(i) > max
%             col(i) = max;
%         end
%     end
    
	ObjVal = Dist(Phen(:,1),1);
    %disp(Phen);
	for t=2:size(Phen,2)
        
%         %Checkvalues
%         col = round(Phen(:,t));
%         for i = 1:size(col)
%             if col(i)<1
%                 col(i) = 1;
%             elseif col(i) > max
%                 col(i) = max;
%             end
%         end
    
        %disp(Phen(:,t))
    	ObjVal=ObjVal+Dist(Phen(:,t),t);
    
	end


% End of function

