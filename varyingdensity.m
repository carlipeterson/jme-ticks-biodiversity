close all; clear all;

%% Setup

l = 100;
%Full
changing_density = [linspace(0, 100, l);linspace(0, 35, l);linspace(0, 70, l);linspace(0, 100, l); ...
    linspace(0, 70, l);linspace(0, 5, l);linspace(0, 50, l); ...
    linspace(0, 10, l);linspace(0, 1, l);linspace(0, 3, l);linspace(0, 1, l); ...
    linspace(0, 4, l);linspace(0, 1, l);linspace(0, 25, l);linspace(0, 120, l)];

% Constant host densities
N2 = [40; 20; 30; 30; 25; 2.1; 6; 1.9; 0.25; 1; 0.2; 1.6; 2; 6.3; 25];
base_N = N2;

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

host_names = {'White-footed mouse', 'Red-backed vole', 'Eastern chipmunk', 'Sorex shrew', 'Short-tailed shrew', 'Veery', 'Squirrel', 'Robin', 'White-tailed deer', 'Opossum', 'Raccoon', 'Wood Thrush', 'Ovenbird', 'Eastern fence lizard', '5-lined skink'};  % <-- replace with your actual species if needed
num_hosts = length(base_N);
%% Loop through each host and vary its density

for k = 1:num_hosts
    % Set up varying and constant density matrices
    N = repmat(base_N, 1, l);
    N(k,:) = changing_density(k,:);
    
    % % Small mammals only
    % excluded_hosts = [6, 8, 9, 10, 11, 12, 13, 14, 15];
    % N(excluded_hosts,:) = 0; base_N(excluded_hosts) = 0; N2 = base_N;
    
    
    % Initialize variables
    sum_bH = zeros(1,l); sum_bHM = zeros(1,l); I = zeros(1,l); T = zeros(1,l); U = zeros(1,l);
    sum_bH2 = zeros(1,l); sum_bHM2 = zeros(1,l); I2 = zeros(1,l); T2 = zeros(1,l); U2 = zeros(1,l);
    
    % Calculate sums
    for j = 1:num_hosts
        sum_bH = sum_bH + b(j) * N(j,:);
        sum_bHM = sum_bHM + b(j) * N(j,:);
        sum_bH2 = sum_bH2 + b(j) * N2(j);
        sum_bHM2 = sum_bHM2 + b(j) * N2(j);
    end

    % Compute I and T
    for j = 1:num_hosts
        I = I + (b(j) * N(j,:) * (C(j)/100)) ./ sum_bHM;
        T = T + (b(j) * N(j,:) * (C(j)/100)) ./ sum_bH;
        U = U + (b(j) * N(j,:)) ./ sum_bH;
        
        I2 = I2 + (b(j) * N2(j) * (C(j)/100)) ./ sum_bHM2;
        T2 = T2 + (b(j) * N2(j) * (C(j)/100)) ./ sum_bH2;
        U2 = U2 + (b(j) * N2(j)) ./ sum_bH2;
    end

    % Compute S, NIP, DIN
    S = (1 - exp(-z/L .* sum_bH));
    S2 = (1 - exp(-z/L * sum_bH2));
    
    NIP = I * 100; 
    NIP2 = I2 * 100;
    DIN = L * s * S .* T;
    DIN2 = L * s * S2 .* T2;
    DON = L * s * S .* U;
    DON2 = L * s * S2 .* U2;
    
    larvae_fed = L.*s.*S;
    larvae_fed2 = L*s.*S2;

    DUN = DON - DIN;
    DUN2 = DON2 - DIN2;

    target_NIP = 0.5;
    diff = abs(target_NIP*DUN - (1-target_NIP)*DIN);
    [~, idx] = min(diff);              % Index where DUN=0.5*DIN
    x_cross = changing_density(k,idx)                % x-value of that point
    figure;
    plot(changing_density(k,:), DUN, 'LineWidth', 2, 'Color', [0.00, 0.45, 0.74])
    hold on
    xline(x_cross, '--k', 'NIP = 50%','LineWidth',1.5)
    plot(changing_density(k,:), DIN, 'LineWidth', 2, 'Color', [0.85, 0.33, 0.10])
    ylabel('Nymph density (nymphs/ha)', 'FontSize',13)
    %ylim([4000 15000])
    ax = gca;  
    ax.YAxis.Exponent = 0;        
    ax.YAxis.TickLabelFormat = '%.0f';
    xlabel([host_names{k} ' density (individuals/ha)'], 'FontSize',13)
    legend({'Uninfected nymphs', '','Infected nymphs'}, ...
           'Location', 'southeast')
end