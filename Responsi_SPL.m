
clc;
clear;
close all;

% Urutan variabel:
% x(1) = harga tepung (Rp/kg)
% x(2) = harga beras  (Rp/kg)
% x(3) = harga ayam   (Rp/kg)
% x(4) = harga telur  (Rp/kg)

A = [5    2.5  0.5  1.5;
     1    4    2    0.75;
     0.5  2    6    1.5;
     2    1    0.9  4.25];

b = [161000;
     149000;
     251500;
     173000];

% Parameter iterasi
tol = 1e-8;
maxIter = 1000;
x = zeros(4,1);  % Tebakan awal

for iter = 1:maxIter

    xLama = x;

    for i = 1:4

        jumlah = 0;

        for j = 1:4

            if j < i
                % Nilai dari iterasi saat ini
                jumlah = jumlah + A(i,j)*x(j);

            elseif j > i
                % Nilai dari iterasi sebelumnya
                jumlah = jumlah + A(i,j)*xLama(j);

            end

        end

        x(i) = (b(i) - jumlah)/A(i,i);

    end

    % Galat ant iterasi
    galatIterasi = norm(x - xLama, inf);

    if galatIterasi < tol
        break;
    end

end

% Pemeriksaan residual
residual = norm(A*x - b, inf);

% Menampilkan hasil
fprintf('HASIL METODE GAUSS-SEIDEL\n');
fprintf('Jumlah iterasi = %d\n', iter);
fprintf('Galat iterasi  = %.6e\n', galatIterasi);
fprintf('Residual       = %.6e\n\n', residual);

fprintf('Harga beras  = Rp %.2f per kg\n', x(2));
fprintf('Harga telur  = Rp %.2f per kg\n', x(4));
fprintf('Harga tepung = Rp %.2f per kg\n', x(1));
fprintf('Harga ayam   = Rp %.2f per kg\n', x(3));

