clc,clear,
load('STM_17_2022_third_flight.mat')
%% Extract data
Date = datetime(SD1_LOG00084_epoch_ms, 'ConvertFrom','epochtime','Epoch','1970-01-01','TicksPerSecond',1000)';
Time_sec = (0:time_step:(length(SD1_LOG00084_r_eb_eD)-1)*time_step)'./1000;

a_eb_bX = SD1_LOG00084_a_eb_bX';
a_eb_bY = SD1_LOG00084_a_eb_bY';
a_eb_bZ = SD1_LOG00084_a_eb_bZ';

v_eb_eD = SD1_LOG00084_v_eb_eD';
v_eb_eE = SD1_LOG00084_v_eb_eE';
v_eb_eN = SD1_LOG00084_v_eb_eN';

r_eb_eD = SD1_LOG00084_r_eb_eD';
r_eb_eE = SD1_LOG00084_r_eb_eE';
r_eb_eN = SD1_LOG00084_r_eb_eN';

phi = SD1_LOG00084_phi';
theta = SD1_LOG00084_theta';
psi = SD1_LOG00084_psi';

p = SD1_LOG00084_p';
q = SD1_LOG00084_q';
r = SD1_LOG00084_r';

flaps = SD1_LOG00084_flaps_sp';
camber = SD1_LOG00084_camber_sp';
aileron = SD1_LOG00084_aileron_sp';
elevator = SD1_LOG00084_elevator_sp';
rudder = SD1_LOG00084_rudder_sp';

v_a = SD1_LOG00084_v_a_calc';
tether_Load = SD1_LOG00084_LoadFiltered';

reel_out_speed = SD1_LOG00084_reel_out_speed';
tether_length = SD1_LOG00084_tether_length';

%%


T = table(Date,Time_sec,a_eb_bX,a_eb_bY,a_eb_bZ,v_eb_eD,v_eb_eE,v_eb_eN,...
    r_eb_eD,r_eb_eE,r_eb_eN,phi,theta,psi,p,q,r,flaps,camber,aileron,...
    rudder,v_a,tether_Load,reel_out_speed,tether_length);
writetable(T,'Measurement.xlsx');