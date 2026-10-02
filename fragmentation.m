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

% %Molting percentage
% M = [41.5; 41; 41.2; 49.6; 46.8; 33.9; 59.3; 33.9; 56.3; 44.1; 36.5; 33.9; 33.9; 29.7; 29.7];
M = [100*ones(length(C),1)];
%M = [90; 90; 77; 68; 68; 90; 70; 65; 75; 82; 78; 72; 72; 50; 50];
%Tick preference (#larvae/#hosts)
b = [73.4; 23.3; 44.5; 84.6; 87.8; 20; 165.4; 96; 1963.3; 73.3; 88; 22; 6; 5; 28.9];

L = 115000; s = 0.4333;
% % Compute mu and zs

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
            sum_bHM(i,:) = sum_bHM(i,:) + b(j,:).*N(j,:).*(M(j)/100);
            sum_bH2(i,:) = sum_bH2(i,:) + b(j,:) .* N2(j,:);
            sum_bHM2(i,:) = sum_bHM2(i,:) + b(j,:).*N2(j,:).*(M(j)/100);
        end
    end

    % Compute I
    for j = 1:num_hosts
        if hosts(i,j) == 1
            I(i,:) = I(i,:) + b(j,:) .* N(j,:) * (M(j)/100) * (C(j)/100) ./ sum_bHM(i,:);
            I2(i,:) = I2(i,:) + b(j,:) .* N2(j,:) * (M(j)/100) * (C(j)/100) ./ sum_bHM2(i,:);
        end
    end
    % Compute Larvae that Become Nymphs after Feeding
    for j = 1:num_hosts
        if hosts(i,j) == 1
            T(i,:) = T(i,:) + b(j,:) .* N(j,:) * (M(j)/100)*(C(j)/100) ./ sum_bH(i,:);
            T2(i,:) = T2(i,:) + b(j,:) .* N2(j,:) * (M(j)/100)*(C(j)/100) ./ sum_bH2(i,:);
            U(i,:) = U(i,:) + b(j,:) .* N(j,:) * (M(j)/100) ./ sum_bH(i,:);
            U2(i,:) = U2(i,:) + b(j,:) .* N2(j,:) * (M(j)/100) ./ sum_bH2(i,:);

        end
    end
end


% Compute S
S = (1-exp(-z/L*sum_bH));
S2 = (1-exp(-z/L*sum_bH2));
% Compute NIP and DIN
%I(1) = 0;
NIP = I*100;
NIP2 = I2*100;
DIN = L.*s.*S.*T;
DIN2 = L.*s.*S2.*T2;
DON = L.*s.*S.*U;
DON2 = L.*s.*S2.*U2;
larvae_feeding = L*s.*S;
DON - DIN;

NIP_R=100*b(8,:) .* N2(8,:) * (M(8)/100) * (C(8)/100) ./ sum_bHM2;
NIP_WT=100*b(9,:) .* N2(9,:) * (M(9)/100) * (C(9)/100) ./ sum_bHM2;
NIP_O=100*b(10,:) .* N2(10,:) * (M(10)/100) * (C(10)/100) ./ sum_bHM2;
NIP_V=100*b(11,:) .* N2(11,:) * (M(11)/100) * (C(11)/100) ./ sum_bHM2;
NIP_birds=NIP_R+NIP_WT+NIP_O+NIP_V;

DIN_R=L.*s.*S2.*b(8,:) .* N2(8,:) * (M(8)/100)*(C(8)/100) ./ sum_bH2;
DIN_WT=L.*s.*S2.*b(9,:) .* N2(9,:) * (M(9)/100)*(C(9)/100) ./ sum_bH2;
DIN_O=L.*s.*S2.*b(10,:) .* N2(10,:) * (M(10)/100)*(C(10)/100) ./ sum_bH2;
DIN_V=L.*s.*S2.*b(11,:) .* N2(11,:) * (M(11)/100)*(C(11)/100) ./ sum_bH2;
DIN_birds=DIN_R+DIN_WT+DIN_O+DIN_V;

% % Compute average NIP and DIN
% for i = 1:num_combos
%     intNIP(i) = trapz(changing_density, NIP(i,:));
%     intDIN(i) = trapz(changing_density, DIN(i,:));
% end
% T1 = table(intNIP', intDIN' , host_labels','VariableNames', {'NIP', 'DIN','Hosts'});
% T1_sorted = sortrows(T1, 'NIP');
% disp(T1_sorted);
% 
% T2 = table(intNIP', intDIN' , host_labels','VariableNames', {'NIP', 'DIN','Hosts'});
% T2_sorted = sortrows(T2, 'DIN');
% disp(T2_sorted);

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
%ylim([325 575])
% title('Our Model Results')
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
%ylim([0 14500])
% title('Our Model Results')
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
%ylim([0 1200])
% title('Our Model Results')
legend('Location', 'best')
grid on
hold off

% figure(4);
% colors = lines(7); % use a standard color set
% linestyles = {'-', '--', ':', '-.'};
% hold on
% for i = 1:num_combos
%     colorIdx = mod(i-1, size(colors,1)) + 1;
%     styleIdx = mod(i-1, length(linestyles)) + 1;
%     plot(changing_density, larvae_feeding(i,:), 'Color', colors(colorIdx,:),'LineStyle',linestyles{styleIdx},'LineWidth', 2, 'DisplayName', host_labels{i})
% end
% xlabel('Mouse density (mice/ha)')
% ylabel('Larvae Feeding (larvae/ha)')
% ylim([0 4500])
% % title('Our Model Results')
% legend('Location', 'best')
% grid on
% hold off
% 
% figure(5);
% colors = lines(7); % use a standard color set
% linestyles = {'-', '--', ':', '-.'};
% hold on
% for i = 1:num_combos
%     colorIdx = mod(i-1, size(colors,1)) + 1;
%     styleIdx = mod(i-1, length(linestyles)) + 1;
%     plot(changing_density, DON(i,:)-DIN(i,:), 'Color', colors(colorIdx,:),'LineStyle',linestyles{styleIdx},'LineWidth', 2, 'DisplayName', host_labels{i})
% end
% xlabel('Mouse density (mice/ha)')
% ylabel('Uninfected nymphs (nymphs/ha)')
% % title('Our Model Results')
% legend('Location', 'best')
% grid on
hold off
% %% Changing Densities
% figure(3)
% plot(changing_density, NIP(i,:),'LineWidth', 2)
% hold on
% plot(changing_density, NIP2(i,:),'LineWidth', 2, 'LineStyle', '--')
% xlabel('Squirrel density (squirrels/ha)')
% ylabel('NIP (%)')
% ylim([20 50])
% legend('Changing density', 'Constant density','Location', 'best')
% grid on
% 
% figure(4)
% plot(changing_density, DIN(i,:),'LineWidth', 2)
% hold on
% plot(changing_density, DIN2(i,:),'LineWidth', 2, 'LineStyle', '--')
% xlabel('Squirrel density (squirrels/ha)')
% ylabel('DIN (nymphs/ha)')
% ylim([100 200])
% legend('Changing density', 'Constant density','Location', 'best')
% grid on

% figure
% yyaxis left
% ax = gca;
% ax.YColor = 'k';
% plot(changing_density, NIP(i,:),'LineWidth', 2)
% hold on
% plot(changing_density, NIP2(i,:),'LineWidth', 2, 'LineStyle', '--')
% ylabel('NIP (%)')
% ylim([0 60])
% 
% yyaxis right
% ax.YColor = 'k';
% plot(changing_density, DIN(i,:),'LineWidth', 2)
% hold on
% plot(changing_density, DIN2(i,:),'LineWidth', 2, 'LineStyle', '--')
% ylabel('DIN (nymphs/ha)')
% ylim([130 230])
% 
% xlabel('Sorex shrew density (shrews/ha)')
% legend({'NIP with changing density', 'NIP with constant density','DIN with changing density', 'DIN wiht constant density'},'Location', 'southwest')
% grid on

% figure(6)
% plot(changing_density, NIP_R(i,:),'LineWidth', 2)
% hold on
% plot(changing_density, NIP_WT(i,:),'LineWidth', 2, 'LineStyle', '--')
% hold on
% plot(changing_density, NIP_O(i,:),'LineWidth', 2, 'LineStyle', '--')
% hold on
% plot(changing_density, NIP_V(i,:),'LineWidth', 2, 'LineStyle', '--')
% hold on
% plot(changing_density, NIP_birds(i,:),'LineWidth', 2, 'LineStyle', '--')
% xlabel('Density')
% ylabel('NIP (%)')
% legend('Robin', 'WT','Ovenbird','Veery','All birds','Location', 'best')
% grid on
% 
% figure(7)
% plot(changing_density, DIN_R(i,:),'LineWidth', 2)
% hold on
% plot(changing_density, DIN_WT(i,:),'LineWidth', 2, 'LineStyle', '--')
% hold on
% plot(changing_density, DIN_O(i,:),'LineWidth', 2, 'LineStyle', '--')
% hold on
% plot(changing_density, DIN_V(i,:),'LineWidth', 2, 'LineStyle', '--')
% hold on
% plot(changing_density, DIN_birds(i,:),'LineWidth', 2, 'LineStyle', '--')
% xlabel('Density')
% ylabel('DIN')
% legend('Robin', 'WT','Ovenbird','Veery','All birds','Location', 'best')
% grid on