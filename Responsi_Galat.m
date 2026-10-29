
clc;
clear;
close all;

% Parameter berdasarkan soal
lambda = 12;
alpha = 36;
beta = 10;
h0 = 5;

% Rentang x: 0 sampai 5! = 120
x = linspace(0, factorial(5), 1001);

% Argumen fungsi cosinus dan eksponensial
z = 2*pi*x/lambda;
u = -beta*x;

% Fungsi eksak
hEksak = h0*(cos(z) + alpha*exp(u));

% Jumlah suku deret Taylor yang dibandingkan
nList = [23, 24, 25];
hPendekatan = cell(1, numel(nList));

MAE = zeros(1, numel(nList));
galatMaks = zeros(1, numel(nList));
galatRelatifPersen = zeros(1, numel(nList));

for j = 1:numel(nList)

    n = nList(j);

    cosTaylor = zeros(size(x));
    expTaylor = zeros(size(x));

    % Deret Taylor cosinus dan eksponensial
    for k = 0:n-1

        cosTaylor = cosTaylor + ...
            ((-1)^k .* z.^(2*k)) ./ factorial(2*k);

        expTaylor = expTaylor + ...
            (u.^k) ./ factorial(k);

    end

    % Fungsi hasil pendekatan
    hPendekatan{j} = h0*(cosTaylor + alpha*expTaylor);

    % Galat absolut
    galat = abs(hPendekatan{j} - hEksak);

    % Rerata galat absolut
    MAE(j) = mean(galat);

    % Galat absolut maksimum
    galatMaks(j) = max(galat);

    % Galat rata-rata ternormalisasi
    galatRelatifPersen(j) = ...
        MAE(j)/max(abs(hEksak))*100;

    fprintf('\nJumlah suku n = %d\n', n);
    fprintf('Rerata galat absolut (MAE) = %.6e\n', MAE(j));
    fprintf('Galat absolut maksimum    = %.6e\n', galatMaks(j));
    fprintf('MAE ternormalisasi        = %.6e%%\n', ...
        galatRelatifPersen(j));

end

% Grafik perbandingan empat fungsi
figure;

plot(x, hEksak, 'k-', 'LineWidth', 1.5);
hold on;

plot(x, hPendekatan{1}, 'r--', 'LineWidth', 1.0);
plot(x, hPendekatan{2}, 'b-.', 'LineWidth', 1.0);
plot(x, hPendekatan{3}, 'g:', 'LineWidth', 1.0);

grid on;
xlabel('x');
ylabel('h(x)');
title('Perbandingan Fungsi Eksak dan Pendekatan Taylor');

legend('Eksak', 'n = 23', 'n = 24', 'n = 25', ...
       'Location', 'best');

hold off;

saveas(gcf, 'Kasus1_Grafik.png');

