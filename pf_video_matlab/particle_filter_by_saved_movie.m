%% Parameters
% reference 
F_update = [1 0 1 0; 0 1 0 1; 0 0 1 0; 0 0 0 1];

Npop_particles = 4000;

Xstd_rgb = 50; %方差
Xstd_pos = 25;
Xstd_vec = 5;

Xrgb_trgt = [255; 0; 0];

%% Loading Movie

%也可以使用Person.wmv
vr = VideoReader('v_CliffDiving_g17_c05.avi');

Npix_resolution = [vr.Width vr.Height];
Nfrm_movie = floor(vr.Duration * vr.FrameRate);

%% Object Tracking by Particle Filter

X = create_particles(Npix_resolution, Npop_particles); % 粒子初始化，在画面中产生均匀分布的随机粒子

for k = 1:Nfrm_movie
    
    % Getting Image
    Y_k = read(vr, k);
    
    % Forecasting
    %通过状态模型预测  这里采用的是在上一时刻基础上叠加噪声
    X = update_particles(F_update, Xstd_pos, Xstd_vec, X); 
    
    % Calculating Log Likelihood
    L = calc_log_likelihood(Xstd_rgb, Xrgb_trgt, X(1:2, :), Y_k);
    
    % Resampling
    X = resample_particles(X, L);

    % Showing Image
    show_particles(X, Y_k); 
%    show_state_estimated(X, Y_k);

end

