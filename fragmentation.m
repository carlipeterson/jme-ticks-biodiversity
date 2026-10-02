close all; clear all;

%% Host data

l = 100;
changing_density = linspace(0, 100, l);
%Host density
%Mice; Voles; Chipmunks; Sorex shrews; Short-tailed shrews; Veery;
%Squirrel; Robin; White-tailed deer; Opossum; Raccoon; Wood thrush;
%Ovenbird; Eastern fence lizard; 5-lined skink

N = [changing_density; 20*ones(1,l); 30*ones(1,l); 30*ones(1,l); 25*ones(1,l); 2.1*ones(1,l); 6*ones(1,l); 1.9*ones(1,l); 0.25*ones(1,l); 1*ones(1,l); 0.2*ones(1,l); 1.6*ones(1,l); 2*ones(1,l); 6.3*ones(1,l); 25*ones(1,l)];
N2 = [40*ones(1,l); 20*ones(1,l); 30*ones(1,l); 30*ones(1,l); 25*ones(1,l); 2.1*ones(1,l); 6*ones(1,l); 1.9*ones(1,l); 0.25*ones(1,l); 1*ones(1,l); 0.2*ones(1,l); 1.6*ones(1,l); 2*ones(1,l); 6.3*ones(1,l); 25*ones(1,l)];

%Realized reservoir competence
C = [92.1; 61.2; 55; 51.2; 41.8; 28.9; 14.7; 13.8; 4.6; 2.6; 1.3; 1.3; 1.1; 2; 0];

%Tick preference (#larvae/#hosts)
b = [73.4; 23.3; 44.5; 84.6; 87.8; 20; 165.4; 96; 1963.3; 73.3; 88; 22; 6; 5; 28.9];

L = 115000; s = 0.4333;

SLsum0 = 0; 
for i = 1:length(b)
    SLsum0 = SLsum0+b(i)*N2(i);
end

z = -L*log(1-0.1/s)/SLsum0;

%% Host combinations to compare (each row is a scenario)
% hosts = [1,0,0,0,0,0,0,0,0,0; 
%     1,1,0,0,0,0,0,0,0,0; 
%     1,0,1,0,0,0,0,0,0,0; 
%     1,0,0,1,0,0,0,0,0,0; 
%     1,0,0,0,1,0,0,0,0,0; 
%     1,0,0,0,0,1,0,0,0,0; 
%     1,0,0,0,0,0,1,0,0,0; 
%     1,0,0,0,0,0,0,1,0,0;
%     1,0,0,0,0,0,0,0,1,0;
%     1,0,0,0,0,0,0,0,0,1;
%     1,1,1,1,1,1,1,1,1,1];
% hosts = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1; 
%     1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1; 
%     1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1; 
%     1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0; 
%     1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% hosts = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; 
%     1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0; 
%     1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0; 
%     1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0; 
%     1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0; 
%     1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0; 
%     1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0; 
%     1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;
%     1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0;
%     1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0;
%     1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0;
%     1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0;
%     1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0;
%     1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0;
%     1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0;
%     1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1;
%     1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
% hosts = [1,0,0,0,0,0,0,0,0,0; 
%     0,1,0,0,0,0,0,0,0,0; 
%     0,0,1,0,0,0,0,0,0,0; 
%     0,0,0,1,0,0,0,0,0,0; 
%     0,0,0,0,1,0,0,0,0,0; 
%     0,0,0,0,0,1,0,0,0,0; 
%     0,0,0,0,0,0,1,0,0,0; 
%     0,0,0,0,0,0,0,1,0,0;
%     0,0,0,0,0,0,0,0,1,0;
%     0,0,0,0,0,0,0,0,0,1];
%hosts = [1,0,0,0,0,0,0,0,0,0;1,1,1,0,0,0,0,0,0,0;1,1,1,1,1,1,0,0,0,0;1,1,1,1,1,1,1,1,0,0;1,1,1,1,1,1,1,1,1,1];
% hosts = [1,1,1,1,1,1,1,1,1,1,1,1,1;
%     1,0,1,1,1,1,1,1,1,1,1,1,1;
%     1,1,0,1,1,1,1,1,1,1,1,1,1;
%     1,1,1,0,1,1,1,1,1,1,1,1,1;
%     1,1,1,1,0,1,1,1,1,1,1,1,1;
%     1,1,1,1,1,0,1,1,1,1,1,1,1;
%     1,1,1,1,1,1,0,1,1,1,1,1,1;
%     1,1,1,1,1,1,1,0,1,1,1,1,1;
%     1,1,1,1,1,1,1,1,0,1,1,1,1;
%     1,1,1,1,1,1,1,1,1,0,1,1,1;
%     1,1,1,1,1,1,1,1,1,1,0,1,1;
%     1,1,1,1,1,1,1,1,1,1,1,0,1;
%     1,1,1,1,1,1,1,1,1,1,1,1,0];

hosts = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
    1,1,1,1,1,1,1,1,0,0,0,1,1,1,1;
    1,1,1,1,1,0,1,0,0,0,0,0,0,0,0;
    1,1,1,1,1,0,0,0,0,0,0,0,0,0,0;
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

% hosts = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];

% host_labels = {'Mice','+Chipmunks','+Deer', '+Raccoons', '+Opossums', '+Skunks', '+Shrews', '+Birds', '+Sorex shrews', '+Squirrels', 'All Hosts'};
%host_labels = {'Mice','+Chipmunks','+Deer', '+Raccoons', '+Opossums', '+Skunks', '+Shrews', '+Robins', '+Gray catbirds','+Wood thrush','+Ovenbirds','+Veeries','+Sorex shrews', '+Squirrels', '+5-lined skink','+Eastern fence lizard', 'All Hosts'};
% host_labels = {'All Hosts','All Mammals and Reptiles','Small Mammals and Reptiles', 'Small Mammals', 'Mice'};
%host_labels = {'Mice','All Hosts'};
%host_labels = {'All hosts','-Mice','-Chipmunks','-Deer', '-Raccoons', '-Opossums', '-Skunks', '-Shrews', '-Robins', '-Wood thrush','-Ovenbirds','-Veeries', '-Sorex shrews', '-Squirrels'};
%host_labels = {'Mice','+Chipmunks','+Shrews','+Deer', '+Raccoons', '+Opposums','+Skunks','+Sorex Shrews', '+Birds','+Squirrels'};
host_labels = {'All hosts', 'Birds, reptiles, small mammals','Small mammals','Mice, chipmunk, shrews', 'Mice'};


num_combos = size(hosts, 1);
num_hosts = size(N,1);

%% Computation

% Set up empty vectors
sum_bH = zeros(num_combos, l);
sum_bHM = zeros(num_combos, l);
I = zeros(num_combos, l);
T = zeros(num_combos, l);
U = zeros(num_combos,l);
sum_bH2 = zeros(num_combos, l);
sum_bHM2 = zeros(num_combos, l);
I2 = zeros(num_combos, l);
T2 = zeros(num_combos, l);
U2 = zeros(num_combos, l);

% Loop through host combinations
for i = 1:num_combos
    % Compute K and sum
    for j = 1:num_hosts
        if hosts(i,j) == 1
            sum_bH(i,:) = sum_bH(i,:) + b(j,:) .* N(j,:);
            sum_bH2(i,:) = sum_bH2(i,:) + b(j,:) .* N2(j,:);
        end
    end

    % Compute I
    for j = 1:num_hosts
        if hosts(i,j) == 1
            I(i,:) = I(i,:) + b(j,:) .* N(j,:) * (C(j)/100) ./ sum_bH(i,:);
            I2(i,:) = I2(i,:) + b(j,:) .* N2(j,:) * (C(j)/100) ./ sum_bH(i,:);
        end
    end
    % Compute Larvae that Become Nymphs after Feeding
    for j = 1:num_hosts
        if hosts(i,j) == 1
            T(i,:) = T(i,:) + b(j,:) .* N(j,:)*(C(j)/100) ./ sum_bH(i,:);
            T2(i,:) = T2(i,:) + b(j,:) .* N2(j,:) *(C(j)/100) ./ sum_bH2(i,:);
            U(i,:) = U(i,:) + b(j,:) .* N(j,:)./ sum_bH(i,:);
            U2(i,:) = U2(i,:) + b(j,:) .* N2(j,:) ./ sum_bH2(i,:);

        end
    end
end


% Compute S
S = (1-exp(-z/L*sum_bH));
S2 = (1-exp(-z/L*sum_bH2));
% Compute NIP and DIN
NIP = I*100;
NIP2 = I2*100;
DIN = L.*s.*S.*T;
DIN2 = L.*s.*S2.*T2;
DON = L.*s.*S.*U;
DON2 = L.*s.*S2.*U2;
larvae_feeding = L*s.*S;
DON - DIN;

figure(1);
colors = lines(7); % use a standard color set
linestyles = {'-', '--', ':', '-.'};
hold on
for i = 1:num_combos
    colorIdx = mod(i-1, size(colors,1)) + 1;
    styleIdx = mod(i-1, length(linestyles)) + 1;
    plot(changing_density, NIP(i,:), 'Color', colors(colorIdx,:),'LineStyle',linestyles{styleIdx},'LineWidth', 2, 'DisplayName', host_labels{i})
end
xlabel('Mouse density (mice/ha)', 'FontSize',13)
ylabel('NIP (%)', 'FontSize',13)
% title('Our Model Results')
legend('Location', 'best')
grid on
% 
figure(2);
colors = lines(7); % use a standard color set
linestyles = {'-', '--', ':', '-.'};
hold on
for i = 1:num_combos-1
    colorIdx = mod(i-1, size(colors,1)) + 1;
    styleIdx = mod(i-1, length(linestyles)) + 1;
    plot(changing_density, DIN(i,:)-DIN(5,:), 'Color', colors(colorIdx,:),'LineStyle',linestyles{styleIdx},'LineWidth', 2, 'DisplayName', host_labels{i})
end
xlabel('Mouse density (mice/ha)', 'FontSize',13)
ylabel('Relative DIN (nymphs/ha)', 'FontSize',13)
legend('Location', 'best')
grid on
hold off

figure(3);
colors = lines(7); % use a standard color set
linestyles = {'-', '--', ':', '-.'};
hold on
for i = 1:num_combos
    colorIdx = mod(i-1, size(colors,1)) + 1;
    styleIdx = mod(i-1, length(linestyles)) + 1;
    plot(changing_density, DON(i,:), 'Color', colors(colorIdx,:),'LineStyle',linestyles{styleIdx},'LineWidth', 2, 'DisplayName', host_labels{i})
end
xlabel('Mouse density (mice/ha)', 'FontSize',13)
ylabel('DON (nymphs/ha)', 'FontSize',13)
legend('Location', 'best')
grid on
hold off

figure(4);
colors = lines(7); % use a standard color set
linestyles = {'-', '--', ':', '-.'};
hold on
for i = 1:num_combos
    colorIdx = mod(i-1, size(colors,1)) + 1;
    styleIdx = mod(i-1, length(linestyles)) + 1;
    plot(changing_density, DIN(i,:), 'Color', colors(colorIdx,:),'LineStyle',linestyles{styleIdx},'LineWidth', 2, 'DisplayName', host_labels{i})
end
xlabel('Mouse density (mice/ha)', 'FontSize',13)
ylabel('DIN (nymphs/ha)', 'FontSize',13)
legend('Location', 'best')
grid on
hold off