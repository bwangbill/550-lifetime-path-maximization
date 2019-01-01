%{
Bill Wang
Michelle Beryl
EE550 Mini Project
Network with node lifetimes
Using digraphs
%}


function [countpacket,solution1] = randpathfunction()
%initialize source and target nodes, graph
s=[1 1 2 3 3 4 5 6];
t=[2 3 4 4 5 7 6 7];
weights=[1 1 1 1 1 1 1 1];
%s=[1 1 2 3 3 3 4 4 5 6 7 8];
%t=[2 3 4 4 5 6 5 9 9 7 8 9];
%weights=[1 1 1 1 1 1 1 1 1 1 1 1];
G=digraph(s,t,weights);
plot(G);

%{
define paths using node numbers
A=[1 2 5];
B=[1 3 2 5];
C=[1 3 5];
D=[1 3 4 5];
%}


%{
Find the available paths
from github.com/kakearney pathbetweennodes

nnode = max(s);
nedge = length(s);

%sparse(s,t,ones(nedge,1),nnode,nnode);
%}
%adj = adjacency(G);
%pth = pathbetweennodes(adj,1,numnodes(G)); %find all paths

%numedges(G) %count number of edges
%numnodes(G) %count number of nodes
%G.Edges %print list of edges
%G=rmnode(G,[2])

%set initial lifetime for each node i
lifetime=[inf 5 5 5 5 5 inf];
%lifetime=[inf 5 5 5 5 5 5 5 inf];

%{
lifetime=zeros(1,numnodes(G));
lifetime(1)=inf;
lifetime(max(t))=inf;

for i=2:numnodes(G)-1
    lifetime(i)=5;    
end
%}


%main loop, runs while any path still exists from first node to last node
counter=0;
solution=[];
%while counter<22
while isempty(shortestpath(G,1,numnodes(G)))==0
    counter=counter+1;
    adj = adjacency(G);
    pth = pathbetweennodes(adj,1,numnodes(G)); %find all paths
    %pick random valid paths each run
    %pth{i}
    r=ceil(size(pathbetweennodes(adj,1,numnodes(G)),1)*rand); %rand num between # of paths
    pth{r}; %path selected
    solution=[solution pth{r}]; %add path to solution vector
    
    %decrement life along path
    for j=length(pth{r})-1:-1:2
        lifetime(pth{r}(j))=lifetime(pth{r}(j))-1;
        if lifetime(pth{r}(j))==0
            %remove node, remove lifetime counter
            G=rmnode(G, [pth{r}(j)]);
            %{
            figure;
            plot(G);
            %}
            lifetime(pth{r}(j))=[];
        end
    end
    
end

%if node i lifetime=0
%G=rmnode(G,[i])
%lifetime(i)=[]


%G=rmnode(G,[2 3]); remove nodes [i j k] from graph G



%isempty(shortestpath(G,1,numnodes(G)))  % check if a path exists from 1 to last node (5) in graph
solution1=solution;
countpacket=counter;
end


