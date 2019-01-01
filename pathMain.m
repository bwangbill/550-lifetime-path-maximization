%{
pathMain
Bill Wang and Michelle Beryl
EE550

To run:
1. Make sure pathMain.m, pathbetweennodes.m, randpathfunction.m are in the
same folder
2. In randpathfunction, update variables s, t, weights, lifetime
3. s, t, weights must be same size, lifetime must equal the number of nodes
4. Run pathMain
%}
runs=200;
maxP=[];
minP=[];
results=zeros(1,runs);

for i=1:runs
    [results(i),s{i}]=randpathfunction();
end

maxP=max(results);
minP=min(results);



%{
pathbetweennodes.m from user 'kakearney' Github library
github.com/kakearney
%}


