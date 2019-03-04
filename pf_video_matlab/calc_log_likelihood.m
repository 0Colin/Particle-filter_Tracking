function L = calc_log_likelihood(Xstd_rgb, Xrgb_trgt, X, Y) %#codegen

Npix_h = size(Y, 1);
Npix_w = size(Y, 2);

N = size(X,2);

L = zeros(1,N);
Y = permute(Y, [3 1 2]);  %重新安排矩阵

A = -log(sqrt(2 * pi) * Xstd_rgb);
B = - 0.5 / (Xstd_rgb.^2);

X = round(X);

for k = 1:N
    % m,n 粒子k在画面中的位置
    m = X(1,k);
    n = X(2,k);
    
    I = (m >= 1 & m <= Npix_h);
    J = (n >= 1 & n <= Npix_w);
    
    if I && J
        
        C = double(Y(:, m, n));
        
        D = C - Xrgb_trgt;
        
        D2 = D' * D;   % 欧氏距离
        
        L(k) =  A + B * D2;  %高斯似然   D2 越小  L越大  注意B为负数
    else
        
        L(k) = -Inf;
    end
end
