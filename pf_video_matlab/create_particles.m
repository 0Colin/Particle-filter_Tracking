function X = create_particles(Npix_resolution, Npop_particles)

X1 = randi(Npix_resolution(2), 1, Npop_particles);  % ����һ�� 1 x Npop_particles ������������Ԫ��ֵΪ 1��Npix_resolution(2)֮��Ĳ����ľ��ȷֲ���������� 
X2 = randi(Npix_resolution(1), 1, Npop_particles);
X3 = zeros(2, Npop_particles);

X = [X1; X2; X3];
