function[aa]=GENETIC_CLUSTERING(data,moving_parameter)
%%

X = [TREND_VALUE(data,moving_parameter) PERCENTAGE_CHANGE(data)];
k = 2;

CostFunction=@(m) ClusteringCost(m, X);     % Cost Function

VarSize=[k size(X,2)];  % Decision Variables Matrix Size

nVar=prod(VarSize);     % Number of Decision Variables

VarMin= repmat(min(X),k,1);      % Lower Bound of Variables
VarMax= repmat(max(X),k,1);      % Upper Bound of Variables

%% GA Parameters

MaxIt=200;      % Maximum Number of Iterations

nPop=300;        % Population Size

pc=0.8;                 % Crossover Percentage
nc=2*round(pc*nPop/2);  % Number of Offsprings (Parnets)

pm=0.3;                 % Mutation Percentage
nm=round(pm*nPop);      % Number of Mutants

gamma=0.05;

mu=0.02;         % Mutation Rate

beta=8;         % Selection Pressure

%% Initialization

empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Out=[];

pop=repmat(empty_individual,nPop,1);

for i=1:nPop
    
    % Initialize Position
    pop(i).Position=unifrnd(VarMin,VarMax,VarSize);
    
    % Evaluation
    [pop(i).Cost, pop(i).Out]=CostFunction(pop(i).Position);
    
end

% Sort Population
Costs=[pop.Cost];
[Costs, SortOrder]=sort(Costs);
pop=pop(SortOrder);

% Store Best Solution
BestSol=pop(1);

% Array to Hold Best Cost Values
BestCost=zeros(MaxIt,1);

% Store Cost
WorstCost=pop(end).Cost;


%% Main Loop

for it=1:MaxIt
    
    P=exp(-beta*Costs/WorstCost);
    P=P/sum(P);
    
    % Crossover
    popc=repmat(empty_individual,nc/2,2);
    for k=1:nc/2
        
        % Select Parents Indices
        i1=RouletteWheelSelection(P);
        i2=RouletteWheelSelection(P);

        % Select Parents
        p1=pop(i1);
        p2=pop(i2);
        
        % Apply Crossover
        [popc(k,1).Position, popc(k,2).Position]=...
            Crossover(p1.Position,p2.Position,gamma,VarMin,VarMax);
        
        % Evaluate Offsprings
        [popc(k,1).Cost, popc(k,1).Out]=CostFunction(popc(k,1).Position);
        [popc(k,2).Cost, popc(k,2).Out]=CostFunction(popc(k,2).Position);
        
    end
    popc=popc(:);
    
    
    % Mutation
    popm=repmat(empty_individual,nm,1);
    for k=1:nm
        
        % Select Parent
        i=randi([1 nPop]);
        p=pop(i);
        
        % Apply Mutation
        popm(k).Position=Mutate(p.Position,mu,VarMin,VarMax);
        
        % Evaluate Mutant
        [popm(k).Cost, popm(k).Out]=CostFunction(popm(k).Position);
        
    end
    
    % Create Merged Population
    pop=[pop
         popc
         popm]; %#ok
     
    % Sort Population
    Costs=[pop.Cost];
    [Costs, SortOrder]=sort(Costs);
    pop=pop(SortOrder);
    
    % Update Worst Cost
    WorstCost=max(WorstCost,pop(end).Cost);
    
    % Truncation
    pop=pop(1:nPop);
    Costs=Costs(1:nPop);
    
    % Store Best Solution Ever Found
    BestSol=pop(1);
    
    % Store Best Cost Ever Found
    BestCost(it)=BestSol.Cost;
    
    % Show Iteration Information
   % disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    % Plot Solution
    %figure(1);
    %PlotSolution(X, BestSol);
    %pause(0.01);
    
end
aa=pop(1).Out.ind;
bb=BestSol.Position;
save('bb.mat','bb');
end