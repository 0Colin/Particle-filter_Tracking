function X = create_particles(Npix_resolution, Npop_particles)

X1 = randi(Npix_resolution(2), 1, Npop_particles);  % 产生一个 1 x Npop_particles 的行向量，各元素值为 1：Npix_resolution(2)之间的产生的均匀分布的随机整数 
X2 = randi(Npix_resolution(1), 1, Npop_particles);
X3 = zeros(2, Npop_particles);

X = [X1; X2; X3];
