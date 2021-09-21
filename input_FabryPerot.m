%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Solving Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f0_guess= c/1e-6;     %% Guess of the frequency solutions (Hz), f=c/lambda
f0_min  = c/10e-6;     %% filter the solutions where the frequency is superior than (Hz), f=c/lambda
f0_max  = c/1e-6;   %% filter the solutions where the frequency is inferior than (Hz), f=c/lambda
nmodes=10;            %% number of solutions asked 

AbsorbingBoundaryCondition=1;     %% 0 or 1 (not sure it is working well...)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dx=10e-9;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VCSEL structure %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n1=1;
n2=3;
lambda0=1000e-9;      % Central wavelength

l1=1;
l2=5 * lambda0/(2*abs(n2))*1e6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% first column is the length [um]
% second column is the optical index

layer=[    
0.1 n1
l1   n1
l2  n2
l1   n1
0.1 n1
];

layer(:,1)=layer(:,1)*1e-6;

if AbsorbingBoundaryCondition==1
    layer(1,2) = layer(1,2) + 1i;
    layer(end,2) = layer(1,2) + 1i;
end