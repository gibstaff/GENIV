close all;
clear all;
clc;


T = 820; %Temperature K
D_rod = 10.0*10^-3; %diameter m
L_fuel = 100*10^-2; %Fuel length m
x_ave = 20*10^3; %Average linear power density W/m
T_in = 670; %Core inlet temp K



%% For lead

%eqn = A_flow == P^2*sqrt(3)/4-D_rod^2 * pi/8; %Flow area m/s

DeltaT=T-T_in; %Temperature difference
double(DeltaT)

rho_inPb=11441 - 1.2795 * T_in; %Density of lead at 670K found at https://www.matweb.com/search/DataSheet.aspx?MatGUID=ebd6d2cdfdca4fc285885cc4749c36b1&ckck=1 
rho_inPb = rho_inPb 
    

v_inPb=1.5; %speed of lead m/s

cp_Pb = 176.2- 4.923* 10^-2 * T_in + 1.544 * 10^-5 * T_in^2 - (1.524*10^6)/T_in^2 %Specefic heat capacity of lead at 400 degrees, found same link

syms P_Pb

A_flow = P_Pb^2*sqrt(3)/4-D_rod^2 * pi/8; %Flow area m/s

DeltaT=(L_fuel*x_ave)/(2*rho_inPb*v_inPb*A_flow*cp_Pb); % Eqn

eqn =  (L_fuel*x_ave)/(2*rho_inPb*v_inPb*A_flow*cp_Pb) == 150;

isolate(eqn,P_Pb)

%% for Na

v_inNa = 8.0; % Speed of natrium

cp_Na = 1658.2 -0.8479* T_in + 4.4541 * 10^-4 *T_in^2 - (2.9926 * 10^6)/T_in^2;

rho_inNa = 219 + 275.32 * (1- T_in/2503.7) + 511.58 * (1-T_in/2503.7)^0.5;


syms P_Na

A_flow_Na = P_Na^2*sqrt(3)/4-D_rod^2 * pi/8; %Flow area m/s

DeltaT=(L_fuel*x_ave)/(2*rho_inNa*v_inNa*A_flow_Na*cp_Na); % Eqn

eqn_2 =  (L_fuel*x_ave)/(2*rho_inNa*v_inNa*A_flow_Na*cp_Na) == 150;

isolate(eqn_2,P_Na)

% %% Vertical elevation
% 
% H_ch = 150*10^-2; %Height
% my

