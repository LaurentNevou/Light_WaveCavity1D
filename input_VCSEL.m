%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Solving Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f0_guess= c/1e-6;     %% Guess of the frequency solutions (Hz), f=c/lambda
f0_min  = c/1.01e-6;     %% filter the solutions where the frequency is superior than (Hz), f=c/lambda
f0_max  = c/0.95e-6;   %% filter the solutions where the frequency is inferior than (Hz), f=c/lambda
nmodes=60;            %% number of solutions asked 

AbsorbingBoundaryCondition=1;     %% 0 or 1 (not sure it is working well...)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dx=2e-9;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VCSEL structure %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n1=3;
n2=3.6;
lambda0=1000e-9;      % Central wavelength

L1=lambda0/(4*abs(n1));   % thickness at lambda/4
L2=lambda0/(4*abs(n2));   % thickness at lambda/4

n3=3+0.0i;
L3=3 * lambda0/(2*abs(n3));

alpha3=4*pi*imag(n3)./lambda0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N_DBRn=25;                  %% amount of DBR n-doped pairs
N_DBRp=15;                  %% amount of DBR p-doped pairs

DBR_n=[]; DBRn=[ L1 n1 ; L2 n2 ];
DBR_p=[]; DBRp=[ L2 n2 ; L1 n1 ];

for jj=1:N_DBRn
  DBR_n = [ DBR_n ; DBRn ];
end
for jj=1:N_DBRp
  DBR_p = [ DBR_p ; DBRp ];
end

layer=[ DBR_n ; L3   n3 ; DBR_p ];

if AbsorbingBoundaryCondition==1
    layer(1,2) = layer(1,2) + 1i;
    layer(end,2) = layer(1,2) + 1i;
end