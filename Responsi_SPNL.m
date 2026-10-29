
clc;
clear;
close all;

% Volume bola yang diketahui
VbolaDiketahui = 300;

% Persamaan nonlinier
f = @(r) (4/3)*pi*r.^3 - VbolaDiketahui;

% Membuat grafik
rGrafik = linspace(0, 6, 500);

figure;
plot(rGrafik, f(rGrafik), 'b-', 'LineWidth', 1.5);
hold on;
plot(rGrafik, zeros(size(rGrafik)), 'k--');

grid on;
xlabel('Jari-jari r (cm)');
ylabel('f(r)');
title('Grafik Persamaan Nonlinier');
legend('f(r)', 'f(r) = 0', 'Location', 'best');
hold off;

% Menyimpan grafik
saveas(gcf, 'Kasus3_Grafik_Interval.png');

% INTERVAL AWAL
a = 4;
b = 5;

fa = f(a);
fb = f(b);

fprintf('INTERVAL AWAL\n');
fprintf('f(4) = %.6f\n', fa);
fprintf('f(5) = %.6f\n\n', fb);

% Memastikan interval mengurung akar
if fa*fb > 0
    error('Interval awal tidak mengurung akar.');
end

% Parameter metode biseksi
tol = 1e-8;
maxIter = 100;

% PROSES ITERASI BISEKSI
for iter = 1:maxIter

    % Menghitung titik tengah
    c = (a + b)/2;
    fc = f(c);

    % Batas galat jari-jari
    batasGalatR = (b - a)/2;

    % Kondisi berhenti
    if abs(fc) < tol || batasGalatR < tol
        break;
    end

    % Memperbarui interval
    if fa*fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end

end

% HASIL AKHIR
r = c;
tinggiTabung = 2*r;

VbolaHitung = (4/3)*pi*r^3;
Vtabung = pi*r^2*tinggiTabung;
VluarBola = Vtabung - VbolaHitung;

fprintf('HASIL METODE BISEKSI\n');
fprintf('Jumlah iterasi = %d\n', iter);
fprintf('Jari-jari bola = %.8f cm\n', r);
fprintf('Jari-jari tabung = %.8f cm\n', r);
fprintf('Tinggi tabung = %.8f cm\n', tinggiTabung);
fprintf('Volume bola = %.6f cm^3\n', VbolaHitung);
fprintf('Volume tabung = %.6f cm^3\n', Vtabung);
fprintf('Volume tabung di luar bola = %.6f cm^3\n', VluarBola);
fprintf('f(r) pada pendekatan akhir = %.10e\n', fc);
fprintf('Batas galat jari-jari = %.10e cm\n', batasGalatR);

