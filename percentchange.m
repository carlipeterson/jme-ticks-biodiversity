close all; clear all;

%% Host data

% Constant host densities
N = [40; 20; 30; 30; 25; 2.1; 6; 1.9; 0.25; 1; 0.2; 1.6; 2; 6.3; 25];

%Realized reservoir competence
C = [92.1; 61.2; 55; 51.2; 41.8; 28.9; 14.7; 13.8; 4.6; 2.6; 1.3; 1.3; 1.1; 2; 0];

%Tick preference (#larvae/#hosts)
b = [73.4; 23.3; 44.5; 84.6; 87.8; 20; 165.4; 96; 1963.3; 73.3; 88; 22; 6; 5; 28.9];

L = 115000; s = 0.4333;

SLsum0 = 0; 
for i = 1:length(b)
    SLsum0 = SLsum0+b(i)*N(i);
end

z = -L*log(1-0.1/s)/SLsum0;

%% Host combinations to compare (each row is a scenario)
hosts = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    1,1,0,0,0,0,0,0,0,0,0,0,0,0,0; 
    1,0,1,0,0,0,0,0,0,0,0,0,0,0,0; 
    1,0,0,1,0,0,0,0,0,0,0,0,0,0,0; 
    1,0,0,0,1,0,0,0,0,0,0,0,0,0,0; 
    1,0,0,0,0,1,0,0,0,0,0,0,0,0,0; 
    1,0,0,0,0,0,1,0,0,0,0,0,0,0,0; 
    1,0,0,0,0,0,0,1,0,0,0,0,0,0,0;
    1,0,0,0,0,0,0,0,1,0,0,0,0,0,0;
    1,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
    1,0,0,0,0,0,0,0,0,0,1,0,0,0,0;
    1,0,0,0,0,0,0,0,0,0,0,1,0,0,0;
    1,0,0,0,0,0,0,0,0,0,0,0,1,0,0;
    1,0,0,0,0,0,0,0,0,0,0,0,0,1,0;
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,1];

% hosts = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;
%     1,0,1,1,1,1,1,1,1,1,1,1,1,1,1; 
%     1,1,0,1,1,1,1,1,1,1,1,1,1,1,1; 
%     1,1,1,0,1,1,1,1,1,1,1,1,1,1,1;
%     1,1,1,1,0,1,1,1,1,1,1,1,1,1,1;
%     1,1,1,1,1,0,1,1,1,1,1,1,1,1,1;
%     1,1,1,1,1,1,0,1,1,1,1,1,1,1,1;
%     1,1,1,1,1,1,1,0,1,1,1,1,1,1,1;
%     1,1,1,1,1,1,1,1,0,1,1,1,1,1,1;
%     1,1,1,1,1,1,1,1,1,0,1,1,1,1,1;
%     1,1,1,1,1,1,1,1,1,1,0,1,1,1,1;
%     1,1,1,1,1,1,1,1,1,1,1,0,1,1,1;
%     1,1,1,1,1,1,1,1,1,1,1,1,0,1,1;
%     1,1,1,1,1,1,1,1,1,1,1,1,1,0,1;
%     1,1,1,1,1,1,1,1,1,1,1,1,1,1,0];

% hosts = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1;
%     1,1,1,1,1,1,1,0,0,0,0,1,1,1,1; 
%     1,1,0,0,0,0,1,0,0,0,0,1,1,1,1; 
%     1,1,0,0,0,0,1,0,0,0,0,1,1,0,0;
%     1,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

% hosts = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
%     1,1,1,1,1,0,1,0,0,0,0,0,0,0,0;
%     1,1,1,1,1,1,1,1,0,0,0,1,1,1,1;
%     1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];


host_labels = {'All hosts', 'Red-backed vole', 'Eastern chipmunk', 'Sorex shrew', 'Short-tailed shrew', 'Veery', 'Squirrel', 'Robin', 'White-tailed deer', 'Opossum', 'Raccoon', 'Wood Thrush', 'Ovenbird', 'Eastern fence lizard', '5-lined skink'};  % <-- replace with your actual species if needed
%host_labels = {'All hosts','Birds','M & L mammals', 'Lizards', 'Non-mouse S mammals'};
% host_labels = {'Mice','Small mammals','Lizards and birds', 'All hosts'};

num_combos = size(hosts,1);
num_hosts = size(N,1);

%% Computation

% Set up empty vectors
sum_bH = zeros(num_combos,1);
sum_bHM = zeros(num_combos,1);
I = zeros(num_combos,1);
T = zeros(num_combos,1);
U = zeros(num_combos,1);

% Loop through host combinations
for i = 1:num_combos
    % Compute K and sum
    for j = 1:num_hosts
        if hosts(i,j) == 1
            sum_bH(i) = sum_bH(i) + b(j) * N(j);
        end
    end

    % Compute I
    for j = 1:num_hosts
        if hosts(i,j) == 1
            I(i) = I(i) + b(j) .* N(j) * (C(j)/100) ./ sum_bH(i);
        end
    end
    % Compute Larvae that Become Nymphs after Feeding
    for j = 1:num_hosts
        if hosts(i,j) == 1
            T(i) = T(i) + b(j)* N(j) * (C(j)/100) ./ sum_bH(i);
            U(i) = U(i) + b(j)* N(j) ./ sum_bH(i);
        end
    end
end

% Compute S
S = (1-exp(-z/L*sum_bH));

% Compute NIP and DIN
%I(1) = 0;

NIP = I;
DIN = L.*s.*S.*T;
DON = L.*s.*S.*U;
uninfected = DON - DIN;
old_DIN = L.*s.*T;

% Compute percent change
percent_changeNIP = zeros(num_combos-1,1);
absolute_changeDIN = zeros(num_combos-1,1);
absolute_changeDON = zeros(num_combos-1,1);
absolute_changeoldDIN = zeros(num_combos-1,1);
absolute_changeuninfected = zeros(num_combos-1,1);

for i=2:num_combos
    percent_changeNIP(i-1) = 100*((NIP(i)-NIP(1))/NIP(1));
    absolute_changeDIN(i-1) = (DIN(i)-DIN(1));
    absolute_changeDON(i-1) = (DON(i)-DON(1));
    absolute_changeoldDIN(i-1) = (old_DIN(i)-old_DIN(1));
end

% Compute changes relative to baseline (row 1)
change_infected = DIN(2:end) - DIN(1);
change_uninfected = uninfected(2:end) - uninfected(1);


[percent_change_sortedNIP, idx] = sort(percent_changeNIP, 'ascend');
sorted_labelsNIP = host_labels(2:end); % still a cell array
sorted_labelsNIP = sorted_labelsNIP(idx);
[absolute_change_sortedDIN, idx] = sort(absolute_changeDIN, 'ascend');
sorted_labelsDIN = host_labels(2:end); % still a cell array
sorted_labelsDIN = sorted_labelsDIN(idx);
[absolute_change_sortedDON, idx] = sort(absolute_changeDON, 'ascend');
sorted_labelsDON = host_labels(2:end); % still a cell array
sorted_labelsDON = sorted_labelsDON(idx);
[absolute_change_sortedold_DIN, idx] = sort(absolute_changeoldDIN, 'ascend');
sorted_labelsoldDIN = host_labels(2:end); % still a cell array
sorted_labelsoldDIN = sorted_labelsoldDIN(idx);

figure(1); % wider, for labels
b1 = bar(percent_change_sortedNIP);
set(gca,'XTick',1:length(sorted_labelsNIP),'XTickLabel',sorted_labelsNIP,'FontSize',13)
xtickangle(45)
ylabel('Percent Change in NIP (%)','FontSize',13)
grid on


figure(2);
b2 = bar(absolute_change_sortedDIN);
set(gca,'XTick',1:length(sorted_labelsDIN),'XTickLabel',sorted_labelsDIN)
xtickangle(45)
ylabel('Absolute Change in DIN (nymphs/ha)')
grid on



figure(3);
b4 = bar(absolute_change_sortedDON);
set(gca,'XTick',1:length(sorted_labelsDON),'XTickLabel',sorted_labelsDON)
xtickangle(45)
ylabel('Absolute Change in DON (nymphs/ha)')
grid on

[~, idx] = sort(change_infected + change_uninfected, 'ascend');
sorted_labels = host_labels(2:end);
sorted_labels = sorted_labels(idx);

% Sort the changes
sorted_change_infected = change_infected(idx);
sorted_change_uninfected = change_uninfected(idx);

% Stack the changes
stacked_data = [sorted_change_infected, sorted_change_uninfected];

% Plot
figure(4);
b = bar(stacked_data, 'stacked');
b(1).FaceColor = [0.85, 0.33, 0.10];
b(2).FaceColor = [0.00, 0.45, 0.74];
set(gca, 'XTick', 1:length(sorted_labelsDON), 'XTickLabel', sorted_labelsDON, 'FontSize', 13)
xtickangle(45)
ylabel({'Absolute Change in DON', '(nymphs/ha)'}, 'FontSize', 13)
legend({'Infected', 'Uninfected'}, 'Location', 'best')
% ylim([-100 2500])
grid on