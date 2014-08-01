
libname in5 "C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140715\dico5";

%macro pays1;
%let pays1=FR ; %let pays2=IT ; %let pays3=DE ; %let pays4=UK; %let pays5=ES ;
%do nopays=1 %to 5;

data in4.a&&pays&nopays.._res_v1;
set in4.a&&pays&nopays.._res (keep = hprev prev_pib edelta_pib annee qtr model act_pib qtr_prev ann_prev);
run;

%end;

%mend;

%pays1;

data in4.afr_res_v1;
set in4.afr_res_v1;
t3_t1 = 0.4; 
t4_t3 = 0.2;
pib_actuel =460145.0;
format t3_t1 2.1;
format t4_t3 2.1;
run;


data in4.ade_res_v1;
set in4.ade_res_v1;
t3_t1 = 0.7; 
t4_t3 = 0.4;
pib_actuel =630631.5;
format t3_t1 2.1;
format t4_t3 2.1;
run;

data in4.aes_res_v1;
set in4.aes_res_v1;
t3_t1 = 0.8; 
t4_t3 = 0.5;
pib_actuel =231595.9;
format t3_t1 2.1;
format t4_t3 2.1;
run;

data in4.ait_res_v1;
set in4.ait_res_v1;
t3_t1 = 0.4; 
t4_t3 = 0.2;
pib_actuel =340752.5;
format t3_t1 2.1;
format t4_t3 2.1;
run;

data in4.auk_res_v1;
set in4.auk_res_v1;
t3_t1 = 1; 
t4_t3 = 0.8;
pib_actuel =498620.5;
format t3_t1 2.1;
format t4_t3 2.1;
run;



/* 2 eme partie : on met les calculs*/

%macro pays;
%let pays1=FR ; %let pays2=IT ; %let pays3=DE ; %let pays4=UK; %let pays5=ES ;
%do nopays=1 %to 5;

data in4.a&&pays&nopays.._res_v1;
set in4.a&&pays&nopays.._res_v1;
if prev_pib ne . or prev_pib ne 0 then;
variation_pib = ((prev_pib-pib_actuel)/ pib_actuel)*100;
run;

/*data in4.a&&pays&nopays.._res_v1;
set in4.a&&pays&nopays.._res_v1;
if variation_pib lt 0 then
variation_pib = variation_pib * -1;
run;*/

data a&&pays&nopays.._res_v1;
set in4.a&&pays&nopays.._res_v1;
if variation_pib gt 0 then
rank_t3_t1 = variation_pib - t3_t1;
rank_t4_t3 = variation_pib - t4_t3;
run;

data procsum_&&pays&nopays.._v1;
set a&&pays&nopays.._res_v1 (keep= model rank_t3_t1);
run;

data procsum_&&pays&nopays.._v2;
set a&&pays&nopays.._res_v1 (keep= model rank_t4_t3);
run;


proc sql;
update procsum_&&pays&nopays.._v1 set rank_t3_t1 = (rank_t3_t1)**2;
update procsum_&&pays&nopays.._v2 set rank_t4_t3 = (rank_t4_t3)**2;
quit;

proc sort data=procsum_&&pays&nopays.._v1;
by rank_t3_t1;
run;


proc sort data=procsum_&&pays&nopays.._v2;
by rank_t4_t3;
run;

%end;

%mend;

%pays;
