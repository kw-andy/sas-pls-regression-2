/* on met today pour avoir la date sous forme yyyymmdd */

%let today=%sysfunc(today(),yymmddn8.);

libname in1 "C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\dico1";

libname in2 "C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\dico2";

proc printto log="C:\travail\etudes\projetpib\docs\p2_&today._v11.log" new;

%macro dropcolsql;

/*options SOURCE SOURCE2 MACROGEN SYMBOLGEN MLOGIC MPRINT;*/

%let pays1=FR ; %let pays2=AT ; %let pays3=BE ; %let pays4=BG; %let pays5=CZ ; %let pays6=DK ; %let pays7=DE ; %let pays8=EE; %let pays9=IE; %let pays10=EL; %let pays11=ES; %let pays12=HR; %let pays13=IT; %let pays14=CY; 
%let pays15=LV; %let pays16=LT; %let pays17=LU; %let pays18=HU; %let pays19=MT; %let pays20=NL; %let pays21=PL; %let pays22=PT; %let pays23=RO; %let pays24=SI; %let pays25=SK; %let pays26=FI; %let pays27=SE; %let pays28=UK; 

%do nopays=1 %to 28;

data dico&&pays&nopays;
set in1.dico&&pays&nopays;
run;


proc sql;
create table vars1&nopays
as 
select catt(nomvar) as var from dico&&pays&nopays
where (intitule like 'G47_FOOD,I2010,SA,IS-DIT%' or
intitule like 'G47_FOOD,I2010,SA,IS-IT%' or 
intitule like 'G47_FOOD,I2010,WDA,IS-DIT%' or 
intitule like 'G47_FOOD,I2010,WDA,IS-IT%' or 
intitule like 'G47_NFOOD,I2010,SA,IS-DIT%' or 
intitule like 'G47_NFOOD,I2010,SA,IS-IT%' or 
intitule like 'G47_NFOOD,I2010,WDA,IS-DIT%' or 
intitule like 'G47_NFOOD,I2010,WDA,IS-IT%' or 
intitule like 'G47_NFOOD_X_G473,I2010,SA,IS-DIT%' or 
intitule like 'G47_NFOOD_X_G473,I2010,SA,IS-IT%' or 
intitule like 'G47_NFOOD_X_G473,I2010,WDA,IS-DIT%' or 
intitule like 'G47_NFOOD_X_G473,I2010,WDA,IS-IT%' or 
intitule like 'G473,I2010,SA,IS-DIT%' or 
intitule like 'G473,I2010,SA,IS-IT%' or 
intitule like 'G473,I2010,WDA,IS-DIT%' or 
intitule like 'G473,I2010,WDA,IS-IT%' or 
intitule like '1000-PERS-NSA,LM-UN-T-LE25%' or 
intitule like '1000-PERS-SA,LM-UN-T-LE25%' or 
intitule like '1000-PERS-NSA,LM-UN-T-GT25%' or 
intitule like '1000-PERS-SA,LM-UN-T-GT25%' or 
intitule like 'NOMINAL,I2008,NSA,B-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,NSA,B-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,NSA,B-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,SWDA,B-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,SWDA,B-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,SWDA,B-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,WDA,B-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,WDA,B-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,WDA,B-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,NSA,B-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,NSA,B-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,NSA,B-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,SWDA,B-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,SWDA,B-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,SWDA,B-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,WDA,B-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,WDA,B-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,WDA,B-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,NSA,B-F,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,NSA,B-F,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,NSA,B-F,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,SWDA,B-F,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,SWDA,B-F,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,SWDA,B-F,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,WDA,B-F,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,WDA,B-F,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,WDA,B-F,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-F,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-F,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-F,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-F,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-F,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-F,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-F,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-F,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-F,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-F,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-F,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-F,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-F,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-F,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-F,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-F,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-F,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-F,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,NSA,B-E,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,NSA,B-E,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,NSA,B-E,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,SWDA,B-E,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,SWDA,B-E,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,SWDA,B-E,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,WDA,B-E,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,WDA,B-E,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,WDA,B-E,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-E,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-E,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,B-E,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-E,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-E,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,B-E,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-E,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-E,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,B-E,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-E,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-E,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,B-E,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-E,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-E,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,B-E,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-E,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-E,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,B-E,LM-LCI-TOT%' or  
intitule like 'NOMINAL,I2008,NSA,G-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,NSA,G-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,NSA,G-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,SWDA,G-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,SWDA,G-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,SWDA,G-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,WDA,G-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,WDA,G-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,WDA,G-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,G-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,G-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,G-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,G-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,G-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,G-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,G-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,G-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,G-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,G-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,G-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,G-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,G-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,G-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,G-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,G-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,G-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,G-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,NSA,G-J,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,NSA,G-J,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,NSA,G-J,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,SWDA,G-J,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,SWDA,G-J,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,SWDA,G-J,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,WDA,G-J,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,WDA,G-J,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,WDA,G-J,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,G-J,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,G-J,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,G-J,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,G-J,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,G-J,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,G-J,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,G-J,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,G-J,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,G-J,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,G-J,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,G-J,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,G-J,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,G-J,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,G-J,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,G-J,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,G-J,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,G-J,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,G-J,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,NSA,K-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,NSA,K-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,NSA,K-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,SWDA,K-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,SWDA,K-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,SWDA,K-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,WDA,K-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,WDA,K-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,WDA,K-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,K-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,K-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,K-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,K-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,K-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,K-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,K-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,K-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,K-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,K-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,K-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,K-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,K-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,K-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,K-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,K-N,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,K-N,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,K-N,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,NSA,O-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,NSA,O-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,NSA,O-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,SWDA,O-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,SWDA,O-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,SWDA,O-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,I2008,WDA,O-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,I2008,WDA,O-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,I2008,WDA,O-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,O-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,O-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,NSA,O-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,O-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,O-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,SWDA,O-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,O-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,O-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_PRE,WDA,O-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,O-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,O-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,NSA,O-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,O-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,O-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,SWDA,O-S,LM-LCI-TOT%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,O-S,LM-LCI-OTH%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,O-S,LM-LCI-SAL%' or 
intitule like 'NOMINAL,PCH_SAME,WDA,O-S,LM-LCI-TOT%%');

proc sql;
create table vars2&nopays
as 
select catt(nomvar) as var from dico&&pays&nopays
where (
intitule like 'NSA,A-S,GE10,JOBRATE%%' or 
intitule like 'NSA,A-S,TOTAL,JOBRATE%%' or 
intitule like 'NSA,B-S,GE10,JOBRATE%' or 
intitule like 'NSA,B-S,TOTAL,JOBRATE%' or 
intitule like 'NSA,B-N,GE10,JOBRATE%' or 
intitule like 'NSA,B-N,TOTAL,JOBRATE%' or 
intitule like 'NSA,B-E,GE10,JOBRATE%' or 
intitule like 'NSA,B-E,TOTAL,JOBRATE%' or 
intitule like 'NSA,G-I,GE10,JOBRATE%' or 
intitule like 'NSA,G-I,TOTAL,JOBRATE%' or 
intitule like 'NSA,M_N,GE10,JOBRATE%' or 
intitule like 'NSA,M_N,TOTAL,JOBRATE%' or 
intitule like 'NSA,O-Q,GE10,JOBRATE%' or 
intitule like 'NSA,O-Q,TOTAL,JOBRATE%' or 
intitule like 'NSA,R_S,GE10,JOBRATE%' or 
intitule like 'NSA,R_S,TOTAL,JOBRATE%' or 
intitule like 'NSA,NOT_APP,MF-EY1YM-RT%%' or 
intitule like 'NSA,NOT_APP,MF-EY5YM-RT,EA%%' or 
intitule like 'NSA,NOT_APP,MF-EY10YM-RT,EA%%' or 
intitule like 'NSA,NOT_APP,MF-LTGBY-RT%%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P3%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P311%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P312%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P312N%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P313%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P314%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31_S13%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31_S14%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31_S14_S15%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31_S15%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P32_S13%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P3_S13%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P41%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P3%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P311%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P312%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P312N%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P313%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P314%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31_S13%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31_S14%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31_S14_S15%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31_S15%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P32_S13%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P3_S13%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P41%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P3%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P311%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P312%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P312N%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P313%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P314%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31_S13%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31_S14%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31_S14_S15%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31_S15%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P32_S13%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P3_S13%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P41%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P3%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P311%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P312%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P312N%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P313%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P314%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31_S13%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31_S14%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31_S14_S15%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31_S15%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P32_S13%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P3_S13%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P41%' or 
intitule like 'NSA,CPI00_EUR,P3%' or 
intitule like 'NSA,CPI00_EUR,P31%' or 
intitule like 'NSA,CPI00_EUR,P311%' or 
intitule like 'NSA,CPI00_EUR,P312%' or 
intitule like 'NSA,CPI00_EUR,P312N%' or 
intitule like 'NSA,CPI00_EUR,P313%' or 
intitule like 'NSA,CPI00_EUR,P314%' or 
intitule like 'NSA,CPI00_EUR,P31_S13%' or 
intitule like 'NSA,CPI00_EUR,P31_S14%' or 
intitule like 'NSA,CPI00_EUR,P31_S14_S15%' or 
intitule like 'NSA,CPI00_EUR,P31_S15%' or 
intitule like 'NSA,CPI00_EUR,P32_S13%' or 
intitule like 'NSA,CPI00_EUR,P3_S13%' or 
intitule like 'NSA,CPI00_EUR,P41%' or 
intitule like 'SA,CPI00_EUR,P3%' or 
intitule like 'SA,CPI00_EUR,P31%' or 
intitule like 'SA,CPI00_EUR,P311%' or 
intitule like 'SA,CPI00_EUR,P312%' or 
intitule like 'SA,CPI00_EUR,P312N%' or 
intitule like 'SA,CPI00_EUR,P313%' or 
intitule like 'SA,CPI00_EUR,P314%' or 
intitule like 'SA,CPI00_EUR,P31_S13%' or 
intitule like 'SA,CPI00_EUR,P31_S14%' or 
intitule like 'SA,CPI00_EUR,P31_S14_S15%' or 
intitule like 'SA,CPI00_EUR,P31_S15%' or 
intitule like 'SA,CPI00_EUR,P32_S13%' or 
intitule like 'SA,CPI00_EUR,P3_S13%' or 
intitule like 'SA,CPI00_EUR,P41%' or 
intitule like 'SWDA,CPI00_EUR,P3%' or 
intitule like 'SWDA,CPI00_EUR,P31%' or 
intitule like 'SWDA,CPI00_EUR,P311%' or 
intitule like 'SWDA,CPI00_EUR,P312%' or 
intitule like 'SWDA,CPI00_EUR,P312N%' or 
intitule like 'SWDA,CPI00_EUR,P313%' or 
intitule like 'SWDA,CPI00_EUR,P314%' or 
intitule like 'SWDA,CPI00_EUR,P31_S13%' or 
intitule like 'SWDA,CPI00_EUR,P31_S14%' or 
intitule like 'SWDA,CPI00_EUR,P31_S14_S15%' or 
intitule like 'SWDA,CPI00_EUR,P31_S15%' or 
intitule like 'SWDA,CPI00_EUR,P32_S13%' or 
intitule like 'SWDA,CPI00_EUR,P3_S13%' or 
intitule like 'SWDA,CPI00_EUR,P41%' or 
intitule like 'WDA,CPI00_EUR,P3%' or 
intitule like 'WDA,CPI00_EUR,P31%' or 
intitule like 'WDA,CPI00_EUR,P311%' or 
intitule like 'WDA,CPI00_EUR,P312%' or 
intitule like 'WDA,CPI00_EUR,P312N%' or 
intitule like 'WDA,CPI00_EUR,P313%' or 
intitule like 'WDA,CPI00_EUR,P314%' or 
intitule like 'WDA,CPI00_EUR,P31_S13%' or 
intitule like 'WDA,CPI00_EUR,P31_S14%' or 
intitule like 'WDA,CPI00_EUR,P31_S14_S15%' or 
intitule like 'WDA,CPI00_EUR,P31_S15%' or 
intitule like 'WDA,CPI00_EUR,P32_S13%' or 
intitule like 'WDA,CPI00_EUR,P3_S13%' or 
intitule like 'WDA,CPI00_EUR,P41%' or 
intitule like 'NSA,CPI00_NAC,P3%' or 
intitule like 'NSA,CPI00_NAC,P31%' or 
intitule like 'NSA,CPI00_NAC,P311%' or 
intitule like 'NSA,CPI00_NAC,P312%' or 
intitule like 'NSA,CPI00_NAC,P312N%' or 
intitule like 'NSA,CPI00_NAC,P313%' or 
intitule like 'NSA,CPI00_NAC,P314%' or 
intitule like 'NSA,CPI00_NAC,P31_S13%' or 
intitule like 'NSA,CPI00_NAC,P31_S14%' or 
intitule like 'NSA,CPI00_NAC,P31_S14_S15%' or 
intitule like 'NSA,CPI00_NAC,P31_S15%' or 
intitule like 'NSA,CPI00_NAC,P32_S13%' or 
intitule like 'NSA,CPI00_NAC,P3_S13%' or 
intitule like 'NSA,CPI00_NAC,P41%' or 
intitule like 'SA,CPI00_NAC,P3%' or 
intitule like 'SA,CPI00_NAC,P31%' or 
intitule like 'SA,CPI00_NAC,P311%' or 
intitule like 'SA,CPI00_NAC,P312%' or 
intitule like 'SA,CPI00_NAC,P312N%' or 
intitule like 'SA,CPI00_NAC,P313%' or 
intitule like 'SA,CPI00_NAC,P314%' or 
intitule like 'SA,CPI00_NAC,P31_S13%' or 
intitule like 'SA,CPI00_NAC,P31_S14%' or 
intitule like 'SA,CPI00_NAC,P31_S14_S15%' or 
intitule like 'SA,CPI00_NAC,P31_S15%' or 
intitule like 'SA,CPI00_NAC,P32_S13%' or 
intitule like 'SA,CPI00_NAC,P3_S13%' or 
intitule like 'SA,CPI00_NAC,P41%' or 
intitule like 'SWDA,CPI00_NAC,P3%' or 
intitule like 'SWDA,CPI00_NAC,P31%' or 
intitule like 'SWDA,CPI00_NAC,P311%' or 
intitule like 'SWDA,CPI00_NAC,P312%' or 
intitule like 'SWDA,CPI00_NAC,P312N%' or 
intitule like 'SWDA,CPI00_NAC,P313%' or 
intitule like 'SWDA,CPI00_NAC,P314%' or 
intitule like 'SWDA,CPI00_NAC,P31_S13%' or 
intitule like 'SWDA,CPI00_NAC,P31_S14%' or 
intitule like 'SWDA,CPI00_NAC,P31_S14_S15%' or 
intitule like 'SWDA,CPI00_NAC,P31_S15%' or 
intitule like 'SWDA,CPI00_NAC,P32_S13%' or 
intitule like 'SWDA,CPI00_NAC,P3_S13%' or 
intitule like 'SWDA,CPI00_NAC,P41%' or 
intitule like 'WDA,CPI00_NAC,P3%' or 
intitule like 'WDA,CPI00_NAC,P31%' or 
intitule like 'WDA,CPI00_NAC,P311%' or 
intitule like 'WDA,CPI00_NAC,P312%' or 
intitule like 'WDA,CPI00_NAC,P312N%' or 
intitule like 'WDA,CPI00_NAC,P313%' or 
intitule like 'WDA,CPI00_NAC,P314%' or 
intitule like 'WDA,CPI00_NAC,P31_S13%' or 
intitule like 'WDA,CPI00_NAC,P31_S14%' or 
intitule like 'WDA,CPI00_NAC,P31_S14_S15%' or 
intitule like 'WDA,CPI00_NAC,P31_S15%' or 
intitule like 'WDA,CPI00_NAC,P32_S13%' or 
intitule like 'WDA,CPI00_NAC,P3_S13%' or 
intitule like 'WDA,CPI00_NAC,P41%' or 
intitule like 'NSA,CPI05_NAC,P3%' or 
intitule like 'NSA,CPI05_NAC,P31%' or 
intitule like 'NSA,CPI05_NAC,P311%' or 
intitule like 'NSA,CPI05_NAC,P312%' or 
intitule like 'NSA,CPI05_NAC,P312N%' or 
intitule like 'NSA,CPI05_NAC,P313%' or 
intitule like 'NSA,CPI05_NAC,P314%' or 
intitule like 'NSA,CPI05_NAC,P31_S13%' or 
intitule like 'NSA,CPI05_NAC,P31_S14%' or 
intitule like 'NSA,CPI05_NAC,P31_S14_S15%' or 
intitule like 'NSA,CPI05_NAC,P31_S15%' or 
intitule like 'NSA,CPI05_NAC,P32_S13%' or 
intitule like 'NSA,CPI05_NAC,P3_S13%' or 
intitule like 'NSA,CPI05_NAC,P41%' or 
intitule like 'SA,CPI05_NAC,P3%' or 
intitule like 'SA,CPI05_NAC,P31%' or 
intitule like 'SA,CPI05_NAC,P311%' or 
intitule like 'SA,CPI05_NAC,P312%' or 
intitule like 'SA,CPI05_NAC,P312N%' or 
intitule like 'SA,CPI05_NAC,P313%' or 
intitule like 'SA,CPI05_NAC,P314%' or 
intitule like 'SA,CPI05_NAC,P31_S13%' or 
intitule like 'SA,CPI05_NAC,P31_S14%' or 
intitule like 'SA,CPI05_NAC,P31_S14_S15%' or 
intitule like 'SA,CPI05_NAC,P31_S15%' or 
intitule like 'SA,CPI05_NAC,P32_S13%' or 
intitule like 'SA,CPI05_NAC,P3_S13%' or 
intitule like 'SA,CPI05_NAC,P41%' or 
intitule like 'SWDA,CPI05_NAC,P3%' or 
intitule like 'SWDA,CPI05_NAC,P31%' or 
intitule like 'SWDA,CPI05_NAC,P311%' or 
intitule like 'SWDA,CPI05_NAC,P312%' or 
intitule like 'SWDA,CPI05_NAC,P312N%' or 
intitule like 'SWDA,CPI05_NAC,P313%' or 
intitule like 'SWDA,CPI05_NAC,P314%' or 
intitule like 'SWDA,CPI05_NAC,P31_S13%' or 
intitule like 'SWDA,CPI05_NAC,P31_S14%' or 
intitule like 'SWDA,CPI05_NAC,P31_S14_S15%' or 
intitule like 'SWDA,CPI05_NAC,P31_S15%' or 
intitule like 'SWDA,CPI05_NAC,P32_S13%' or 
intitule like 'SWDA,CPI05_NAC,P3_S13%' or 
intitule like 'SWDA,CPI05_NAC,P41%' or 
intitule like 'WDA,CPI05_NAC,P3%' or 
intitule like 'WDA,CPI05_NAC,P31%' or 
intitule like 'WDA,CPI05_NAC,P311%' or 
intitule like 'WDA,CPI05_NAC,P312%' or 
intitule like 'WDA,CPI05_NAC,P312N%' or 
intitule like 'WDA,CPI05_NAC,P313%' or 
intitule like 'WDA,CPI05_NAC,P314%' or 
intitule like 'WDA,CPI05_NAC,P31_S13%' or 
intitule like 'WDA,CPI05_NAC,P31_S14%' or 
intitule like 'WDA,CPI05_NAC,P31_S14_S15%' or 
intitule like 'WDA,CPI05_NAC,P31_S15%' or 
intitule like 'WDA,CPI05_NAC,P32_S13%' or 
intitule like 'WDA,CPI05_NAC,P3_S13%' or 
intitule like 'WDA,CPI05_NAC,P41%' or 
intitule like 'NSA,CPI05_NAC,P3%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P31%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P311%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P312%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P312N%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P313%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P314%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P31_S13%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P31_S14%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P31_S14_S15%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P31_S15%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P32_S13%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P3_S13%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P41%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P3%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P31%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P311%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P312%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P312N%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P313%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P314%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P31_S13%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P31_S14%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P31_S14_S15%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P31_S15%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P32_S13%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P3_S13%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P41%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P3%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P31%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P311%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P312%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P312N%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P313%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P314%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P31_S13%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P31_S14%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P31_S14_S15%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P31_S15%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P32_S13%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P3_S13%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P41%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P3%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P31%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P311%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P312%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P312N%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P313%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P314%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P31_S13%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P31_S14%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P31_S14_S15%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P31_S15%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P32_S13%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P3_S13%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P41%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P3%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P31%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P311%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P312%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P312N%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P313%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P314%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P31_S13%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P31_S14%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P31_S14_S15%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P31_S15%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P32_S13%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P3_S13%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P41%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P3%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P31%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P311%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P312%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P312N%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P313%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P314%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P31_S13%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P31_S14%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P31_S14_S15%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P31_S15%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P32_S13%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P3_S13%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P41%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P3%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P31%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P311%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P312%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P312N%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P313%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P314%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P31_S13%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P31_S14%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P31_S14_S15%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P31_S15%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P32_S13%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P3_S13%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P41%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P3%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P31%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P311%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P312%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P312N%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P313%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P314%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P31_S13%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P31_S14%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P31_S14_S15%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P31_S15%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P32_S13%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P3_S13%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P41%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P3%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P31%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P311%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P312%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P312N%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P313%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P314%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P31_S13%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P31_S14%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P31_S14_S15%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P31_S15%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P32_S13%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P3_S13%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P41%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P3%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P31%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P311%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P312%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P312N%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P313%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P314%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P31_S13%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P31_S14%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P31_S14_S15%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P31_S15%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P32_S13%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P3_S13%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P41%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P3%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P31%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P311%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P312%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P312N%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P313%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P314%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P31_S13%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P31_S14%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P31_S14_S15%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P31_S15%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P32_S13%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P3_S13%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P41%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P3%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P31%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P311%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P312%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P312N%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P313%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P314%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P31_S13%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P31_S14%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P31_S14_S15%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P31_S15%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P32_S13%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P3_S13%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P41%');

proc sql;
create table vars3&nopays
as 
select catt(nomvar) as var from dico&&pays&nopays
where (
intitule like 'NSA,PCH_SAME_CPI05_EUR,P3%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P311%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P312%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P312N%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P313%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P314%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31_S13%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31_S14%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31_S14_S15%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P31_S15%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P32_S13%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P3_S13%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P41%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P3%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P311%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P312%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P312N%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P313%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P314%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31_S13%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31_S14%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31_S14_S15%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P31_S15%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P32_S13%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P3_S13%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P41%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P3%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P311%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P312%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P312N%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P313%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P314%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31_S13%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31_S14%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31_S14_S15%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P31_S15%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P32_S13%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P3_S13%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P41%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P3%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P311%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P312%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P312N%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P313%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P314%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31_S13%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31_S14%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31_S14_S15%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P31_S15%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P32_S13%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P3_S13%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P41%' or 
intitule like 'NSA,CPI00_EUR,B1GM%' or 
intitule like 'NSA,CPI00_EUR,P6%' or 
intitule like 'NSA,CPI00_EUR,P61%' or 
intitule like 'NSA,CPI00_EUR,P62%' or 
intitule like 'NSA,CPI00_EUR,P6_S21%' or 
intitule like 'NSA,CPI00_EUR,P6_S211%' or 
intitule like 'NSA,CPI00_EUR,P6_S2111%' or 
intitule like 'NSA,CPI00_EUR,P6_S2112%' or 
intitule like 'NSA,CPI00_EUR,P6_S212%' or 
intitule like 'NSA,CPI00_EUR,P6_S22%' or 
intitule like 'NSA,CPI00_EUR,P7%' or 
intitule like 'NSA,CPI00_EUR,P71%' or 
intitule like 'NSA,CPI00_EUR,P72%' or 
intitule like 'NSA,CPI00_EUR,P7_S21%' or 
intitule like 'NSA,CPI00_EUR,P7_S211%' or 
intitule like 'NSA,CPI00_EUR,P7_S2111%' or 
intitule like 'NSA,CPI00_EUR,P7_S2112%' or 
intitule like 'NSA,CPI00_EUR,P7_S212%' or 
intitule like 'NSA,CPI00_EUR,P7_S22%' or 
intitule like 'SA,CPI00_EUR,B1GM%' or 
intitule like 'SA,CPI00_EUR,P6%' or 
intitule like 'SA,CPI00_EUR,P61%' or 
intitule like 'SA,CPI00_EUR,P62%' or 
intitule like 'SA,CPI00_EUR,P6_S21%' or 
intitule like 'SA,CPI00_EUR,P6_S211%' or 
intitule like 'SA,CPI00_EUR,P6_S2111%' or 
intitule like 'SA,CPI00_EUR,P6_S2112%' or 
intitule like 'SA,CPI00_EUR,P6_S212%' or 
intitule like 'SA,CPI00_EUR,P6_S22%' or 
intitule like 'SA,CPI00_EUR,P7%' or 
intitule like 'SA,CPI00_EUR,P71%' or 
intitule like 'SA,CPI00_EUR,P72%' or 
intitule like 'SA,CPI00_EUR,P7_S21%' or 
intitule like 'SA,CPI00_EUR,P7_S211%' or 
intitule like 'SA,CPI00_EUR,P7_S2111%' or 
intitule like 'SA,CPI00_EUR,P7_S2112%' or 
intitule like 'SA,CPI00_EUR,P7_S212%' or 
intitule like 'SA,CPI00_EUR,P7_S22%' or 
intitule like 'SWDA,CPI00_EUR,B1GM%' or 
intitule like 'SWDA,CPI00_EUR,P6%' or 
intitule like 'SWDA,CPI00_EUR,P61%' or 
intitule like 'SWDA,CPI00_EUR,P62%' or 
intitule like 'SWDA,CPI00_EUR,P6_S21%' or 
intitule like 'SWDA,CPI00_EUR,P6_S211%' or 
intitule like 'SWDA,CPI00_EUR,P6_S2111%' or 
intitule like 'SWDA,CPI00_EUR,P6_S2112%' or 
intitule like 'SWDA,CPI00_EUR,P6_S212%' or 
intitule like 'SWDA,CPI00_EUR,P6_S22%' or 
intitule like 'SWDA,CPI00_EUR,P7%' or 
intitule like 'SWDA,CPI00_EUR,P71%' or 
intitule like 'SWDA,CPI00_EUR,P72%' or 
intitule like 'SWDA,CPI00_EUR,P7_S21%' or 
intitule like 'SWDA,CPI00_EUR,P7_S211%' or 
intitule like 'SWDA,CPI00_EUR,P7_S2111%' or 
intitule like 'SWDA,CPI00_EUR,P7_S2112%' or 
intitule like 'SWDA,CPI00_EUR,P7_S212%' or 
intitule like 'SWDA,CPI00_EUR,P7_S22%' or 
intitule like 'WDA,CPI00_EUR,B1GM%' or 
intitule like 'WDA,CPI00_EUR,P6%' or 
intitule like 'WDA,CPI00_EUR,P61%' or 
intitule like 'WDA,CPI00_EUR,P62%' or 
intitule like 'WDA,CPI00_EUR,P6_S21%' or 
intitule like 'WDA,CPI00_EUR,P6_S211%' or 
intitule like 'WDA,CPI00_EUR,P6_S2111%' or 
intitule like 'WDA,CPI00_EUR,P6_S2112%' or 
intitule like 'WDA,CPI00_EUR,P6_S212%' or 
intitule like 'WDA,CPI00_EUR,P6_S22%' or 
intitule like 'WDA,CPI00_EUR,P7%' or 
intitule like 'WDA,CPI00_EUR,P71%' or 
intitule like 'WDA,CPI00_EUR,P72%' or 
intitule like 'WDA,CPI00_EUR,P7_S21%' or 
intitule like 'WDA,CPI00_EUR,P7_S211%' or 
intitule like 'WDA,CPI00_EUR,P7_S2111%' or 
intitule like 'WDA,CPI00_EUR,P7_S2112%' or 
intitule like 'WDA,CPI00_EUR,P7_S212%' or 
intitule like 'WDA,CPI00_EUR,P7_S22%' or 
intitule like 'NSA,CPI00_NAC,B1GM%' or 
intitule like 'NSA,CPI00_NAC,P6%' or 
intitule like 'NSA,CPI00_NAC,P61%' or 
intitule like 'NSA,CPI00_NAC,P62%' or 
intitule like 'NSA,CPI00_NAC,P6_S21%' or 
intitule like 'NSA,CPI00_NAC,P6_S211%' or 
intitule like 'NSA,CPI00_NAC,P6_S2111%' or 
intitule like 'NSA,CPI00_NAC,P6_S2112%' or 
intitule like 'NSA,CPI00_NAC,P6_S212%' or 
intitule like 'NSA,CPI00_NAC,P6_S22%' or 
intitule like 'NSA,CPI00_NAC,P7%' or 
intitule like 'NSA,CPI00_NAC,P71%' or 
intitule like 'NSA,CPI00_NAC,P72%' or 
intitule like 'NSA,CPI00_NAC,P7_S21%' or 
intitule like 'NSA,CPI00_NAC,P7_S211%' or 
intitule like 'NSA,CPI00_NAC,P7_S2111%' or 
intitule like 'NSA,CPI00_NAC,P7_S2112%' or 
intitule like 'NSA,CPI00_NAC,P7_S212%' or 
intitule like 'NSA,CPI00_NAC,P7_S22%' or 
intitule like 'SA,CPI00_NAC,B1GM%' or 
intitule like 'SA,CPI00_NAC,P6%' or 
intitule like 'SA,CPI00_NAC,P61%' or 
intitule like 'SA,CPI00_NAC,P62%' or 
intitule like 'SA,CPI00_NAC,P6_S21%' or 
intitule like 'SA,CPI00_NAC,P6_S211%' or 
intitule like 'SA,CPI00_NAC,P6_S2111%' or 
intitule like 'SA,CPI00_NAC,P6_S2112%' or 
intitule like 'SA,CPI00_NAC,P6_S212%' or 
intitule like 'SA,CPI00_NAC,P6_S22%' or 
intitule like 'SA,CPI00_NAC,P7%' or 
intitule like 'SA,CPI00_NAC,P71%' or 
intitule like 'SA,CPI00_NAC,P72%' or 
intitule like 'SA,CPI00_NAC,P7_S21%' or 
intitule like 'SA,CPI00_NAC,P7_S211%' or 
intitule like 'SA,CPI00_NAC,P7_S2111%' or 
intitule like 'SA,CPI00_NAC,P7_S2112%' or 
intitule like 'SA,CPI00_NAC,P7_S212%' or 
intitule like 'SA,CPI00_NAC,P7_S22%' or 
intitule like 'SWDA,CPI00_NAC,B1GM%' or 
intitule like 'SWDA,CPI00_NAC,P6%' or 
intitule like 'SWDA,CPI00_NAC,P61%' or 
intitule like 'SWDA,CPI00_NAC,P62%' or 
intitule like 'SWDA,CPI00_NAC,P6_S21%' or 
intitule like 'SWDA,CPI00_NAC,P6_S211%' or 
intitule like 'SWDA,CPI00_NAC,P6_S2111%' or 
intitule like 'SWDA,CPI00_NAC,P6_S2112%' or 
intitule like 'SWDA,CPI00_NAC,P6_S212%' or 
intitule like 'SWDA,CPI00_NAC,P6_S22%' or 
intitule like 'SWDA,CPI00_NAC,P7%' or 
intitule like 'SWDA,CPI00_NAC,P71%' or 
intitule like 'SWDA,CPI00_NAC,P72%' or 
intitule like 'SWDA,CPI00_NAC,P7_S21%' or 
intitule like 'SWDA,CPI00_NAC,P7_S211%' or 
intitule like 'SWDA,CPI00_NAC,P7_S2111%' or 
intitule like 'SWDA,CPI00_NAC,P7_S2112%' or 
intitule like 'SWDA,CPI00_NAC,P7_S212%' or 
intitule like 'SWDA,CPI00_NAC,P7_S22%' or 
intitule like 'WDA,CPI00_NAC,B1GM%' or 
intitule like 'WDA,CPI00_NAC,P6%' or 
intitule like 'WDA,CPI00_NAC,P61%' or 
intitule like 'WDA,CPI00_NAC,P62%' or 
intitule like 'WDA,CPI00_NAC,P6_S21%' or 
intitule like 'WDA,CPI00_NAC,P6_S211%' or 
intitule like 'WDA,CPI00_NAC,P6_S2111%' or 
intitule like 'WDA,CPI00_NAC,P6_S2112%' or 
intitule like 'WDA,CPI00_NAC,P6_S212%' or 
intitule like 'WDA,CPI00_NAC,P6_S22%' or 
intitule like 'WDA,CPI00_NAC,P7%' or 
intitule like 'WDA,CPI00_NAC,P71%' or 
intitule like 'WDA,CPI00_NAC,P72%' or 
intitule like 'WDA,CPI00_NAC,P7_S21%' or 
intitule like 'WDA,CPI00_NAC,P7_S211%' or 
intitule like 'WDA,CPI00_NAC,P7_S2111%' or 
intitule like 'WDA,CPI00_NAC,P7_S2112%' or 
intitule like 'WDA,CPI00_NAC,P7_S212%' or 
intitule like 'WDA,CPI00_NAC,P7_S22%' or 
intitule like 'NSA,CPI05_NAC,B1GM%' or 
intitule like 'NSA,CPI05_NAC,P6%' or 
intitule like 'NSA,CPI05_NAC,P61%' or 
intitule like 'NSA,CPI05_NAC,P62%' or 
intitule like 'NSA,CPI05_NAC,P6_S21%' or 
intitule like 'NSA,CPI05_NAC,P6_S211%' or 
intitule like 'NSA,CPI05_NAC,P6_S2111%' or 
intitule like 'NSA,CPI05_NAC,P6_S2112%' or 
intitule like 'NSA,CPI05_NAC,P6_S212%' or 
intitule like 'NSA,CPI05_NAC,P6_S22%' or 
intitule like 'NSA,CPI05_NAC,P7%' or 
intitule like 'NSA,CPI05_NAC,P71%' or 
intitule like 'NSA,CPI05_NAC,P72%' or 
intitule like 'NSA,CPI05_NAC,P7_S21%' or 
intitule like 'NSA,CPI05_NAC,P7_S211%' or 
intitule like 'NSA,CPI05_NAC,P7_S2111%' or 
intitule like 'NSA,CPI05_NAC,P7_S2112%' or 
intitule like 'NSA,CPI05_NAC,P7_S212%' or 
intitule like 'NSA,CPI05_NAC,P7_S22%' or 
intitule like 'SA,CPI05_NAC,B1GM%' or 
intitule like 'SA,CPI05_NAC,P6%' or 
intitule like 'SA,CPI05_NAC,P61%' or 
intitule like 'SA,CPI05_NAC,P62%' or 
intitule like 'SA,CPI05_NAC,P6_S21%' or 
intitule like 'SA,CPI05_NAC,P6_S211%' or 
intitule like 'SA,CPI05_NAC,P6_S2111%' or 
intitule like 'SA,CPI05_NAC,P6_S2112%' or 
intitule like 'SA,CPI05_NAC,P6_S212%' or 
intitule like 'SA,CPI05_NAC,P6_S22%' or 
intitule like 'SA,CPI05_NAC,P7%' or 
intitule like 'SA,CPI05_NAC,P71%' or 
intitule like 'SA,CPI05_NAC,P72%' or 
intitule like 'SA,CPI05_NAC,P7_S21%' or 
intitule like 'SA,CPI05_NAC,P7_S211%' or 
intitule like 'SA,CPI05_NAC,P7_S2111%' or 
intitule like 'SA,CPI05_NAC,P7_S2112%' or 
intitule like 'SA,CPI05_NAC,P7_S212%' or 
intitule like 'SA,CPI05_NAC,P7_S22%' or 
intitule like 'SWDA,CPI05_NAC,B1GM%' or 
intitule like 'SWDA,CPI05_NAC,P6%' or 
intitule like 'SWDA,CPI05_NAC,P61%' or 
intitule like 'SWDA,CPI05_NAC,P62%' or 
intitule like 'SWDA,CPI05_NAC,P6_S21%' or 
intitule like 'SWDA,CPI05_NAC,P6_S211%' or 
intitule like 'SWDA,CPI05_NAC,P6_S2111%' or 
intitule like 'SWDA,CPI05_NAC,P6_S2112%' or 
intitule like 'SWDA,CPI05_NAC,P6_S212%' or 
intitule like 'SWDA,CPI05_NAC,P6_S22%' or 
intitule like 'SWDA,CPI05_NAC,P7%' or 
intitule like 'SWDA,CPI05_NAC,P71%' or 
intitule like 'SWDA,CPI05_NAC,P72%' or 
intitule like 'SWDA,CPI05_NAC,P7_S21%' or 
intitule like 'SWDA,CPI05_NAC,P7_S211%' or 
intitule like 'SWDA,CPI05_NAC,P7_S2111%' or 
intitule like 'SWDA,CPI05_NAC,P7_S2112%' or 
intitule like 'SWDA,CPI05_NAC,P7_S212%' or 
intitule like 'SWDA,CPI05_NAC,P7_S22%' or 
intitule like 'WDA,CPI05_NAC,B1GM%' or 
intitule like 'WDA,CPI05_NAC,P6%' or 
intitule like 'WDA,CPI05_NAC,P61%' or 
intitule like 'WDA,CPI05_NAC,P62%' or 
intitule like 'WDA,CPI05_NAC,P6_S21%' or 
intitule like 'WDA,CPI05_NAC,P6_S211%' or 
intitule like 'WDA,CPI05_NAC,P6_S2111%' or 
intitule like 'WDA,CPI05_NAC,P6_S2112%' or 
intitule like 'WDA,CPI05_NAC,P6_S212%' or 
intitule like 'WDA,CPI05_NAC,P6_S22%' or 
intitule like 'WDA,CPI05_NAC,P7%' or 
intitule like 'WDA,CPI05_NAC,P71%' or 
intitule like 'WDA,CPI05_NAC,P72%' or 
intitule like 'WDA,CPI05_NAC,P7_S21%' or 
intitule like 'WDA,CPI05_NAC,P7_S211%' or 
intitule like 'WDA,CPI05_NAC,P7_S2111%' or 
intitule like 'WDA,CPI05_NAC,P7_S2112%' or 
intitule like 'WDA,CPI05_NAC,P7_S212%' or 
intitule like 'WDA,CPI05_NAC,P7_S22%' or  
intitule like 'NSA,PCH_PRE_CPI05_EUR,B1GM%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P6%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P61%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P62%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P6_S21%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P6_S211%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P6_S2111%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P6_S2112%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P6_S212%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P6_S22%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P7%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P71%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P72%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P7_S21%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P7_S211%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P7_S2111%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P7_S2112%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P7_S212%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,P7_S22%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,B1GM%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P6%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P61%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P62%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P6_S21%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P6_S211%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P6_S2111%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P6_S2112%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P6_S212%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P6_S22%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P7%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P71%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P72%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P7_S21%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P7_S211%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P7_S2111%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P7_S2112%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P7_S212%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,P7_S22%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,B1GM%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P6%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P61%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P62%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P6_S21%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P6_S211%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P6_S2111%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P6_S2112%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P6_S212%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P6_S22%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P7%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P71%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P72%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P7_S21%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P7_S211%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P7_S2111%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P7_S2112%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P7_S212%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,P7_S22%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,B1GM%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P6%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P61%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P62%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P6_S21%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P6_S211%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P6_S2111%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P6_S2112%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P6_S212%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P6_S22%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P7%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P71%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P72%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P7_S21%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P7_S211%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P7_S2111%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P7_S2112%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P7_S212%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,P7_S22%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,B1GM%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P6%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P61%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P62%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P6_S21%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P6_S211%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P6_S2111%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P6_S2112%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P6_S212%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P6_S22%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P7%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P71%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P72%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P7_S21%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P7_S211%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P7_S2111%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P7_S2112%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P7_S212%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,P7_S22%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,B1GM%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P6%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P61%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P62%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P6_S21%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P6_S211%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P6_S2111%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P6_S2112%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P6_S212%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P6_S22%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P7%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P71%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P72%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P7_S21%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P7_S211%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P7_S2111%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P7_S2112%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P7_S212%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,P7_S22%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,B1GM%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P6%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P61%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P62%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P6_S21%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P6_S211%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P6_S2111%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P6_S2112%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P6_S212%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P6_S22%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P7%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P71%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P72%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P7_S21%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P7_S211%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P7_S2111%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P7_S2112%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P7_S212%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,P7_S22%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,B1GM%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P6%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P61%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P62%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P6_S21%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P6_S211%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P6_S2111%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P6_S2112%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P6_S212%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P6_S22%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P7%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P71%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P72%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P7_S21%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P7_S211%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P7_S2111%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P7_S2112%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P7_S212%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,P7_S22%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,B1GM%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P6%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P61%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P62%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P6_S21%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P6_S211%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P6_S2111%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P6_S2112%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P6_S212%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P6_S22%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P7%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P71%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P72%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P7_S21%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P7_S211%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P7_S2111%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P7_S2112%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P7_S212%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,P7_S22%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,B1GM%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P6%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P61%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P62%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P6_S21%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P6_S211%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P6_S2111%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P6_S2112%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P6_S212%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P6_S22%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P7%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P71%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P72%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P7_S21%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P7_S211%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P7_S2111%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P7_S2112%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P7_S212%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,P7_S22%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,B1GM%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P6%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P61%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P62%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P6_S21%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P6_S211%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P6_S2111%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P6_S2112%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P6_S212%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P6_S22%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P7%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P71%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P72%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P7_S21%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P7_S211%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P7_S2111%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P7_S2112%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P7_S212%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,P7_S22%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,B1GM%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P6%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P61%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P62%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P6_S21%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P6_S211%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P6_S2111%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P6_S2112%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P6_S212%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P6_S22%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P7%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P71%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P72%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P7_S21%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P7_S211%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P7_S2111%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P7_S2112%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P7_S212%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,P7_S22%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,B1GM%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P6%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P61%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P62%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P6_S21%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P6_S211%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P6_S2111%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P6_S2112%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P6_S212%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P6_S22%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P7%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P71%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P72%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P7_S21%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P7_S211%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P7_S2111%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P7_S2112%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P7_S212%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,P7_S22%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,B1GM%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P6%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P61%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P62%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P6_S21%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P6_S211%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P6_S2111%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P6_S2112%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P6_S212%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P6_S22%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P7%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P71%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P72%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P7_S21%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P7_S211%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P7_S2111%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P7_S2112%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P7_S212%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,P7_S22%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,B1GM%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P6%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P61%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P62%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P6_S21%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P6_S211%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P6_S2111%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P6_S2112%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P6_S212%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P6_S22%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P7%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P71%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P72%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P7_S21%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P7_S211%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P7_S2111%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P7_S2112%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P7_S212%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,P7_S22%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,B1GM%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P6%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P61%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P62%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P6_S21%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P6_S211%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P6_S2111%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P6_S2112%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P6_S212%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P6_S22%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P7%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P71%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P72%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P7_S21%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P7_S211%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P7_S2111%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P7_S2112%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P7_S212%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,P7_S22%');

proc sql;
create table vars4&nopays
as 
select catt(nomvar) as var from dico&&pays&nopays
where (
intitule like 'NSA,MIO_EUR,B11%' or 
intitule like 'NSA,MIO_EUR,B11%' or 
intitule like 'NSA,MIO_EUR,B111%' or 
intitule like 'NSA,MIO_EUR,B112%' or 
intitule like 'NSA,MIO_EUR,B1GM%' or 
intitule like 'NSA,MIO_EUR,P6%' or 
intitule like 'NSA,MIO_EUR,P61%' or 
intitule like 'NSA,MIO_EUR,P62%' or 
intitule like 'NSA,MIO_EUR,P6_S21%' or 
intitule like 'NSA,MIO_EUR,P6_S211%' or 
intitule like 'NSA,MIO_EUR,P6_S2111%' or 
intitule like 'NSA,MIO_EUR,P6_S2112%' or 
intitule like 'NSA,MIO_EUR,P6_S212%' or 
intitule like 'NSA,MIO_EUR,P6_S22%' or 
intitule like 'NSA,MIO_EUR,P7%' or 
intitule like 'NSA,MIO_EUR,P71%' or 
intitule like 'NSA,MIO_EUR,P72%' or 
intitule like 'NSA,MIO_EUR,P7_S21%' or 
intitule like 'NSA,MIO_EUR,P7_S211%' or 
intitule like 'NSA,MIO_EUR,P7_S2111%' or 
intitule like 'NSA,MIO_EUR,P7_S2112%' or 
intitule like 'NSA,MIO_EUR,P7_S212%' or 
intitule like 'NSA,MIO_EUR,P7_S22%' or 
intitule like 'SA,MIO_EUR,B11%' or 
intitule like 'SA,MIO_EUR,B111%' or 
intitule like 'SA,MIO_EUR,B112%' or 
intitule like 'SA,MIO_EUR,B1GM%' or 
intitule like 'SA,MIO_EUR,P6%' or 
intitule like 'SA,MIO_EUR,P61%' or 
intitule like 'SA,MIO_EUR,P62%' or 
intitule like 'SA,MIO_EUR,P6_S21%' or 
intitule like 'SA,MIO_EUR,P6_S211%' or 
intitule like 'SA,MIO_EUR,P6_S2111%' or 
intitule like 'SA,MIO_EUR,P6_S2112%' or 
intitule like 'SA,MIO_EUR,P6_S212%' or 
intitule like 'SA,MIO_EUR,P6_S22%' or 
intitule like 'SA,MIO_EUR,P7%' or 
intitule like 'SA,MIO_EUR,P71%' or 
intitule like 'SA,MIO_EUR,P72%' or 
intitule like 'SA,MIO_EUR,P7_S21%' or 
intitule like 'SA,MIO_EUR,P7_S211%' or 
intitule like 'SA,MIO_EUR,P7_S2111%' or 
intitule like 'SA,MIO_EUR,P7_S2112%' or 
intitule like 'SA,MIO_EUR,P7_S212%' or 
intitule like 'SA,MIO_EUR,P7_S22%' or 
intitule like 'SWDA,MIO_EUR,B11%' or 
intitule like 'SWDA,MIO_EUR,B111%' or 
intitule like 'SWDA,MIO_EUR,B112%' or 
intitule like 'SWDA,MIO_EUR,B1GM%' or 
intitule like 'SWDA,MIO_EUR,P6%' or 
intitule like 'SWDA,MIO_EUR,P61%' or 
intitule like 'SWDA,MIO_EUR,P62%' or 
intitule like 'SWDA,MIO_EUR,P6_S21%' or 
intitule like 'SWDA,MIO_EUR,P6_S211%' or 
intitule like 'SWDA,MIO_EUR,P6_S2111%' or 
intitule like 'SWDA,MIO_EUR,P6_S2112%' or 
intitule like 'SWDA,MIO_EUR,P6_S212%' or 
intitule like 'SWDA,MIO_EUR,P6_S22%' or 
intitule like 'SWDA,MIO_EUR,P7%' or 
intitule like 'SWDA,MIO_EUR,P71%' or 
intitule like 'SWDA,MIO_EUR,P72%' or 
intitule like 'SWDA,MIO_EUR,P7_S21%' or 
intitule like 'SWDA,MIO_EUR,P7_S211%' or 
intitule like 'SWDA,MIO_EUR,P7_S2111%' or 
intitule like 'SWDA,MIO_EUR,P7_S2112%' or 
intitule like 'SWDA,MIO_EUR,P7_S212%' or 
intitule like 'SWDA,MIO_EUR,P7_S22%' or 
intitule like 'WDA,MIO_EUR,B11%' or 
intitule like 'WDA,MIO_EUR,B111%' or 
intitule like 'WDA,MIO_EUR,B112%' or 
intitule like 'WDA,MIO_EUR,B1GM%' or 
intitule like 'WDA,MIO_EUR,P6%' or 
intitule like 'WDA,MIO_EUR,P61%' or 
intitule like 'WDA,MIO_EUR,P62%' or 
intitule like 'WDA,MIO_EUR,P6_S21%' or 
intitule like 'WDA,MIO_EUR,P6_S211%' or 
intitule like 'WDA,MIO_EUR,P6_S2111%' or 
intitule like 'WDA,MIO_EUR,P6_S2112%' or 
intitule like 'WDA,MIO_EUR,P6_S212%' or 
intitule like 'WDA,MIO_EUR,P6_S22%' or 
intitule like 'WDA,MIO_EUR,P7%' or 
intitule like 'WDA,MIO_EUR,P71%' or 
intitule like 'WDA,MIO_EUR,P72%' or 
intitule like 'WDA,MIO_EUR,P7_S21%' or 
intitule like 'WDA,MIO_EUR,P7_S211%' or 
intitule like 'WDA,MIO_EUR,P7_S2111%' or 
intitule like 'WDA,MIO_EUR,P7_S2112%' or 
intitule like 'WDA,MIO_EUR,P7_S212%' or 
intitule like 'WDA,MIO_EUR,P7_S22%' or 
intitule like 'NSA,PC_GDP,B11%' or 
intitule like 'NSA,PC_GDP,B11%' or 
intitule like 'NSA,PC_GDP,B111%' or 
intitule like 'NSA,PC_GDP,B112%' or 
intitule like 'NSA,PC_GDP,B1GM%' or 
intitule like 'NSA,PC_GDP,P6%' or 
intitule like 'NSA,PC_GDP,P61%' or 
intitule like 'NSA,PC_GDP,P62%' or 
intitule like 'NSA,PC_GDP,P6_S21%' or 
intitule like 'NSA,PC_GDP,P6_S211%' or 
intitule like 'NSA,PC_GDP,P6_S2111%' or 
intitule like 'NSA,PC_GDP,P6_S2112%' or 
intitule like 'NSA,PC_GDP,P6_S212%' or 
intitule like 'NSA,PC_GDP,P6_S22%' or 
intitule like 'NSA,PC_GDP,P7%' or 
intitule like 'NSA,PC_GDP,P71%' or 
intitule like 'NSA,PC_GDP,P72%' or 
intitule like 'NSA,PC_GDP,P7_S21%' or 
intitule like 'NSA,PC_GDP,P7_S211%' or 
intitule like 'NSA,PC_GDP,P7_S2111%' or 
intitule like 'NSA,PC_GDP,P7_S2112%' or 
intitule like 'NSA,PC_GDP,P7_S212%' or 
intitule like 'NSA,PC_GDP,P7_S22%' or 
intitule like 'SA,PC_GDP,B11%' or 
intitule like 'SA,PC_GDP,B111%' or 
intitule like 'SA,PC_GDP,B112%' or 
intitule like 'SA,PC_GDP,B1GM%' or 
intitule like 'SA,PC_GDP,P6%' or 
intitule like 'SA,PC_GDP,P61%' or 
intitule like 'SA,PC_GDP,P62%' or 
intitule like 'SA,PC_GDP,P6_S21%' or 
intitule like 'SA,PC_GDP,P6_S211%' or 
intitule like 'SA,PC_GDP,P6_S2111%' or 
intitule like 'SA,PC_GDP,P6_S2112%' or 
intitule like 'SA,PC_GDP,P6_S212%' or 
intitule like 'SA,PC_GDP,P6_S22%' or 
intitule like 'SA,PC_GDP,P7%' or 
intitule like 'SA,PC_GDP,P71%' or 
intitule like 'SA,PC_GDP,P72%' or 
intitule like 'SA,PC_GDP,P7_S21%' or 
intitule like 'SA,PC_GDP,P7_S211%' or 
intitule like 'SA,PC_GDP,P7_S2111%' or 
intitule like 'SA,PC_GDP,P7_S2112%' or 
intitule like 'SA,PC_GDP,P7_S212%' or 
intitule like 'SA,PC_GDP,P7_S22%' or 
intitule like 'SWDA,PC_GDP,B11%' or 
intitule like 'SWDA,PC_GDP,B111%' or 
intitule like 'SWDA,PC_GDP,B112%' or 
intitule like 'SWDA,PC_GDP,B1GM%' or 
intitule like 'SWDA,PC_GDP,P6%' or 
intitule like 'SWDA,PC_GDP,P61%' or 
intitule like 'SWDA,PC_GDP,P62%' or 
intitule like 'SWDA,PC_GDP,P6_S21%' or 
intitule like 'SWDA,PC_GDP,P6_S211%' or 
intitule like 'SWDA,PC_GDP,P6_S2111%' or 
intitule like 'SWDA,PC_GDP,P6_S2112%' or 
intitule like 'SWDA,PC_GDP,P6_S212%' or 
intitule like 'SWDA,PC_GDP,P6_S22%' or 
intitule like 'SWDA,PC_GDP,P7%' or 
intitule like 'SWDA,PC_GDP,P71%' or 
intitule like 'SWDA,PC_GDP,P72%' or 
intitule like 'SWDA,PC_GDP,P7_S21%' or 
intitule like 'SWDA,PC_GDP,P7_S211%' or 
intitule like 'SWDA,PC_GDP,P7_S2111%' or 
intitule like 'SWDA,PC_GDP,P7_S2112%' or 
intitule like 'SWDA,PC_GDP,P7_S212%' or 
intitule like 'SWDA,PC_GDP,P7_S22%' or 
intitule like 'WDA,PC_GDP,B11%' or 
intitule like 'WDA,PC_GDP,B111%' or 
intitule like 'WDA,PC_GDP,B112%' or 
intitule like 'WDA,PC_GDP,B1GM%' or 
intitule like 'WDA,PC_GDP,P6%' or 
intitule like 'WDA,PC_GDP,P61%' or 
intitule like 'WDA,PC_GDP,P62%' or 
intitule like 'WDA,PC_GDP,P6_S21%' or 
intitule like 'WDA,PC_GDP,P6_S211%' or 
intitule like 'WDA,PC_GDP,P6_S2111%' or 
intitule like 'WDA,PC_GDP,P6_S2112%' or 
intitule like 'WDA,PC_GDP,P6_S212%' or 
intitule like 'WDA,PC_GDP,P6_S22%' or 
intitule like 'WDA,PC_GDP,P7%' or 
intitule like 'WDA,PC_GDP,P71%' or 
intitule like 'WDA,PC_GDP,P72%' or 
intitule like 'WDA,PC_GDP,P7_S21%' or 
intitule like 'WDA,PC_GDP,P7_S211%' or 
intitule like 'WDA,PC_GDP,P7_S2111%' or 
intitule like 'WDA,PC_GDP,P7_S2112%' or 
intitule like 'WDA,PC_GDP,P7_S212%' or 
intitule like 'WDA,PC_GDP,P7_S22%' or 
--intitule like 'NSA,I2000,B1GM%' or 
intitule like 'NSA,I2000,B1GM%' or 
intitule like 'NSA,I2000,P6%' or 
intitule like 'NSA,I2000,P61%' or 
intitule like 'NSA,I2000,P62%' or 
intitule like 'NSA,I2000,P7%' or 
intitule like 'NSA,I2000,P71%' or 
intitule like 'NSA,I2000,P72%' or 
intitule like 'SA,I2000,B1GM%' or 
intitule like 'SA,I2000,P6%' or 
intitule like 'SA,I2000,P61%' or 
intitule like 'SA,I2000,P62%' or 
intitule like 'SA,I2000,P7%' or 
intitule like 'SA,I2000,P71%' or 
intitule like 'SA,I2000,P72%' or 
intitule like 'SWDA,I2000,B1GM%' or 
intitule like 'SWDA,I2000,P6%' or 
intitule like 'SWDA,I2000,P61%' or 
intitule like 'SWDA,I2000,P62%' or 
intitule like 'SWDA,I2000,P7%' or 
intitule like 'SWDA,I2000,P71%' or 
intitule like 'SWDA,I2000,P72%' or 
intitule like 'WDA,I2000,B1GM%' or 
intitule like 'WDA,I2000,P6%' or 
intitule like 'WDA,I2000,P61%' or 
intitule like 'WDA,I2000,P62%' or 
intitule like 'WDA,I2000,P7%' or 
intitule like 'WDA,I2000,P71%' or 
intitule like 'WDA,I2000,P72%' or 
intitule like 'NSA,MIO_EUR_CLV2000,B1GM%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P6%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P61%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P62%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P6_S21%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P6_S211%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P6_S2111%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P6_S2112%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P6_S212%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P6_S22%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P7%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P71%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P72%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P7_S21%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P7_S211%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P7_S2111%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P7_S2112%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P7_S212%' or 
intitule like 'NSA,MIO_EUR_CLV2000,P7_S22%' or 
intitule like 'SA,MIO_EUR_CLV2000,B1GM%' or 
intitule like 'SA,MIO_EUR_CLV2000,P6%' or 
intitule like 'SA,MIO_EUR_CLV2000,P61%' or 
intitule like 'SA,MIO_EUR_CLV2000,P62%' or 
intitule like 'SA,MIO_EUR_CLV2000,P6_S21%' or 
intitule like 'SA,MIO_EUR_CLV2000,P6_S211%' or 
intitule like 'SA,MIO_EUR_CLV2000,P6_S2111%' or 
intitule like 'SA,MIO_EUR_CLV2000,P6_S2112%' or 
intitule like 'SA,MIO_EUR_CLV2000,P6_S212%' or 
intitule like 'SA,MIO_EUR_CLV2000,P6_S22%' or 
intitule like 'SA,MIO_EUR_CLV2000,P7%' or 
intitule like 'SA,MIO_EUR_CLV2000,P71%' or 
intitule like 'SA,MIO_EUR_CLV2000,P72%' or 
intitule like 'SA,MIO_EUR_CLV2000,P7_S21%' or 
intitule like 'SA,MIO_EUR_CLV2000,P7_S211%' or 
intitule like 'SA,MIO_EUR_CLV2000,P7_S2111%' or 
intitule like 'SA,MIO_EUR_CLV2000,P7_S2112%' or 
intitule like 'SA,MIO_EUR_CLV2000,P7_S212%' or 
intitule like 'SA,MIO_EUR_CLV2000,P7_S22%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,B1GM%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P6%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P61%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P62%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P6_S21%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P6_S211%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P6_S2111%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P6_S2112%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P6_S212%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P6_S22%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P7%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P71%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P72%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P7_S21%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P7_S211%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P7_S2111%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P7_S2112%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P7_S212%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,P7_S22%' or 
intitule like 'WDA,MIO_EUR_CLV2000,B1GM%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P6%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P61%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P62%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P6_S21%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P6_S211%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P6_S2111%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P6_S2112%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P6_S212%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P6_S22%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P7%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P71%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P72%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P7_S21%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P7_S211%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P7_S2111%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P7_S2112%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P7_S212%' or 
intitule like 'WDA,MIO_EUR_CLV2000,P7_S22%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P6%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P61%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P62%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P6_S21%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P6_S211%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P6_S2111%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P6_S2112%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P6_S212%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P6_S22%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P7%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P71%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P72%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P7_S21%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P7_S211%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P7_S2111%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P7_S2112%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P7_S212%' or 
intitule like 'NSA,MIO_EUR_CLV2005,P7_S22%' or 
intitule like 'SA,MIO_EUR_CLV2005,B1GM%' or 
intitule like 'SA,MIO_EUR_CLV2005,P6%' or 
intitule like 'SA,MIO_EUR_CLV2005,P61%' or 
intitule like 'SA,MIO_EUR_CLV2005,P62%' or 
intitule like 'SA,MIO_EUR_CLV2005,P6_S21%' or 
intitule like 'SA,MIO_EUR_CLV2005,P6_S211%' or 
intitule like 'SA,MIO_EUR_CLV2005,P6_S2111%' or 
intitule like 'SA,MIO_EUR_CLV2005,P6_S2112%' or 
intitule like 'SA,MIO_EUR_CLV2005,P6_S212%' or 
intitule like 'SA,MIO_EUR_CLV2005,P6_S22%' or 
intitule like 'SA,MIO_EUR_CLV2005,P7%' or 
intitule like 'SA,MIO_EUR_CLV2005,P71%' or 
intitule like 'SA,MIO_EUR_CLV2005,P72%' or 
intitule like 'SA,MIO_EUR_CLV2005,P7_S21%' or 
intitule like 'SA,MIO_EUR_CLV2005,P7_S211%' or 
intitule like 'SA,MIO_EUR_CLV2005,P7_S2111%' or 
intitule like 'SA,MIO_EUR_CLV2005,P7_S2112%' or 
intitule like 'SA,MIO_EUR_CLV2005,P7_S212%' or 
intitule like 'SA,MIO_EUR_CLV2005,P7_S22%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P6%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P61%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P62%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P6_S21%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P6_S211%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P6_S2111%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P6_S2112%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P6_S212%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P6_S22%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P7%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P71%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P72%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P7_S21%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P7_S211%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P7_S2111%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P7_S2112%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P7_S212%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,P7_S22%' or 
intitule like 'WDA,MIO_EUR_CLV2005,B1GM%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P6%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P61%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P62%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P6_S21%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P6_S211%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P6_S2111%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P6_S2112%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P6_S212%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P6_S22%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P7%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P71%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P72%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P7_S21%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P7_S211%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P7_S2111%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P7_S2112%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P7_S212%' or 
intitule like 'WDA,MIO_EUR_CLV2005,P7_S22%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,B11%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,B11%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,B111%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,B112%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,B1GM%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P6%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P61%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P62%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P6_S21%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P6_S211%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P6_S2111%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P6_S2112%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P6_S212%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P6_S22%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P7%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P71%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P72%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P7_S21%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P7_S211%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P7_S2111%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P7_S2112%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P7_S212%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,P7_S22%' or 
intitule like 'SA,MIO_EUR_KP_PRE,B11%' or 
intitule like 'SA,MIO_EUR_KP_PRE,B111%' or 
intitule like 'SA,MIO_EUR_KP_PRE,B112%' or 
intitule like 'SA,MIO_EUR_KP_PRE,B1GM%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P6%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P61%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P62%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P6_S21%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P6_S211%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P6_S2111%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P6_S2112%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P6_S212%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P6_S22%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P7%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P71%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P72%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P7_S21%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P7_S211%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P7_S2111%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P7_S2112%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P7_S212%' or 
intitule like 'SA,MIO_EUR_KP_PRE,P7_S22%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,B11%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,B111%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,B112%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,B1GM%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P6%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P61%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P62%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P6_S21%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P6_S211%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P6_S2111%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P6_S2112%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P6_S212%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P6_S22%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P7%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P71%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P72%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P7_S21%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P7_S211%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P7_S2111%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P7_S2112%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P7_S212%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,P7_S22%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,B11%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,B111%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,B112%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,B1GM%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P6%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P61%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P62%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P6_S21%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P6_S211%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P6_S2111%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P6_S2112%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P6_S212%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P6_S22%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P7%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P71%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P72%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P7_S21%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P7_S211%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P7_S2111%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P7_S2112%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P7_S212%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,P7_S22%' or 
intitule like 'NSA,MIO_NAC_CLV2000,B1GM%' or 
intitule like 'NSA,MIO_NAC_CLV2000,B1GM%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P6%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P61%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P62%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P6_S21%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P6_S211%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P6_S2111%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P6_S2112%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P6_S212%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P6_S22%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P7%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P71%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P72%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P7_S21%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P7_S211%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P7_S2111%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P7_S2112%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P7_S212%' or 
intitule like 'NSA,MIO_NAC_CLV2000,P7_S22%' or 
intitule like 'SA,MIO_NAC_CLV2000,B1GM%' or 
intitule like 'SA,MIO_NAC_CLV2000,P6%' or 
intitule like 'SA,MIO_NAC_CLV2000,P61%' or 
intitule like 'SA,MIO_NAC_CLV2000,P62%' or 
intitule like 'SA,MIO_NAC_CLV2000,P6_S21%' or 
intitule like 'SA,MIO_NAC_CLV2000,P6_S211%' or 
intitule like 'SA,MIO_NAC_CLV2000,P6_S2111%' or 
intitule like 'SA,MIO_NAC_CLV2000,P6_S2112%' or 
intitule like 'SA,MIO_NAC_CLV2000,P6_S212%' or 
intitule like 'SA,MIO_NAC_CLV2000,P6_S22%' or 
intitule like 'SA,MIO_NAC_CLV2000,P7%' or 
intitule like 'SA,MIO_NAC_CLV2000,P71%' or 
intitule like 'SA,MIO_NAC_CLV2000,P72%' or 
intitule like 'SA,MIO_NAC_CLV2000,P7_S21%' or 
intitule like 'SA,MIO_NAC_CLV2000,P7_S211%' or 
intitule like 'SA,MIO_NAC_CLV2000,P7_S2111%' or 
intitule like 'SA,MIO_NAC_CLV2000,P7_S2112%' or 
intitule like 'SA,MIO_NAC_CLV2000,P7_S212%' or 
intitule like 'SA,MIO_NAC_CLV2000,P7_S22%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,B1GM%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P6%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P61%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P62%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P6_S21%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P6_S211%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P6_S2111%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P6_S2112%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P6_S212%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P6_S22%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P7%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P71%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P72%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P7_S21%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P7_S211%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P7_S2111%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P7_S2112%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P7_S212%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,P7_S22%' or 
intitule like 'WDA,MIO_NAC_CLV2000,B1GM%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P6%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P61%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P62%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P6_S21%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P6_S211%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P6_S2111%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P6_S2112%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P6_S212%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P6_S22%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P7%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P71%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P72%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P7_S21%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P7_S211%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P7_S2111%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P7_S2112%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P7_S212%' or 
intitule like 'WDA,MIO_NAC_CLV2000,P7_S22%');

proc sql;
create table vars5&nopays
as 
select catt(nomvar) as var from dico&&pays&nopays
where (
intitule like 'NSA,MIO_NAC_CLV2005,B1GM%' or 
intitule like 'NSA,MIO_NAC_CLV2005,B1GM%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P6%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P61%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P62%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P6_S21%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P6_S211%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P6_S2111%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P6_S2112%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P6_S212%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P6_S22%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P7%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P71%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P72%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P7_S21%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P7_S211%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P7_S2111%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P7_S2112%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P7_S212%' or 
intitule like 'NSA,MIO_NAC_CLV2005,P7_S22%' or 
intitule like 'SA,MIO_NAC_CLV2005,B1GM%' or 
intitule like 'SA,MIO_NAC_CLV2005,P6%' or 
intitule like 'SA,MIO_NAC_CLV2005,P61%' or 
intitule like 'SA,MIO_NAC_CLV2005,P62%' or 
intitule like 'SA,MIO_NAC_CLV2005,P6_S21%' or 
intitule like 'SA,MIO_NAC_CLV2005,P6_S211%' or 
intitule like 'SA,MIO_NAC_CLV2005,P6_S2111%' or 
intitule like 'SA,MIO_NAC_CLV2005,P6_S2112%' or 
intitule like 'SA,MIO_NAC_CLV2005,P6_S212%' or 
intitule like 'SA,MIO_NAC_CLV2005,P6_S22%' or 
intitule like 'SA,MIO_NAC_CLV2005,P7%' or 
intitule like 'SA,MIO_NAC_CLV2005,P71%' or 
intitule like 'SA,MIO_NAC_CLV2005,P72%' or 
intitule like 'SA,MIO_NAC_CLV2005,P7_S21%' or 
intitule like 'SA,MIO_NAC_CLV2005,P7_S211%' or 
intitule like 'SA,MIO_NAC_CLV2005,P7_S2111%' or 
intitule like 'SA,MIO_NAC_CLV2005,P7_S2112%' or 
intitule like 'SA,MIO_NAC_CLV2005,P7_S212%' or 
intitule like 'SA,MIO_NAC_CLV2005,P7_S22%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,B1GM%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P6%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P61%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P62%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P6_S21%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P6_S211%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P6_S2111%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P6_S2112%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P6_S212%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P6_S22%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P7%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P71%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P72%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P7_S21%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P7_S211%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P7_S2111%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P7_S2112%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P7_S212%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,P7_S22%' or 
intitule like 'WDA,MIO_NAC_CLV2005,B1GM%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P6%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P61%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P62%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P6_S21%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P6_S211%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P6_S2111%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P6_S2112%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P6_S212%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P6_S22%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P7%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P71%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P72%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P7_S21%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P7_S211%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P7_S2111%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P7_S2112%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P7_S212%' or 
intitule like 'WDA,MIO_NAC_CLV2005,P7_S22%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,B11%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,B11%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,B111%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,B112%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,B1GM%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P6%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P61%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P62%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P6_S21%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P6_S211%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P6_S2111%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P6_S2112%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P6_S212%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P6_S22%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P7%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P71%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P72%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P7_S21%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P7_S211%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P7_S2111%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P7_S2112%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P7_S212%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,P7_S22%' or 
intitule like 'SA,MIO_NAC_KP_PRE,B11%' or 
intitule like 'SA,MIO_NAC_KP_PRE,B111%' or 
intitule like 'SA,MIO_NAC_KP_PRE,B112%' or 
intitule like 'SA,MIO_NAC_KP_PRE,B1GM%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P6%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P61%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P62%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P6_S21%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P6_S211%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P6_S2111%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P6_S2112%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P6_S212%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P6_S22%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P7%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P71%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P72%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P7_S21%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P7_S211%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P7_S2111%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P7_S2112%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P7_S212%' or 
intitule like 'SA,MIO_NAC_KP_PRE,P7_S22%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,B11%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,B111%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,B112%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,B1GM%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P6%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P61%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P62%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P6_S21%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P6_S211%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P6_S2111%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P6_S2112%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P6_S212%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P6_S22%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P7%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P71%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P72%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P7_S21%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P7_S211%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P7_S2111%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P7_S2112%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P7_S212%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,P7_S22%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,B11%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,B111%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,B112%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,B1GM%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P6%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P61%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P62%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P6_S21%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P6_S211%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P6_S2111%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P6_S2112%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P6_S212%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P6_S22%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P7%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P71%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P72%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P7_S21%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P7_S211%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P7_S2111%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P7_S2112%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P7_S212%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,P7_S22%' or 
intitule like 'NSA,PCH_PRE,B1GM%' or 
intitule like 'NSA,PCH_PRE,B1GM%' or 
intitule like 'NSA,PCH_PRE,P6%' or 
intitule like 'NSA,PCH_PRE,P61%' or 
intitule like 'NSA,PCH_PRE,P62%' or 
intitule like 'NSA,PCH_PRE,P7%' or 
intitule like 'NSA,PCH_PRE,P71%' or 
intitule like 'NSA,PCH_PRE,P72%' or 
intitule like 'SA,PCH_PRE,B1GM%' or 
intitule like 'SA,PCH_PRE,P6%' or 
intitule like 'SA,PCH_PRE,P61%' or 
intitule like 'SA,PCH_PRE,P62%' or 
intitule like 'SA,PCH_PRE,P7%' or 
intitule like 'SA,PCH_PRE,P71%' or 
intitule like 'SA,PCH_PRE,P72%' or 
intitule like 'SWDA,PCH_PRE,B1GM%' or 
intitule like 'SWDA,PCH_PRE,P6%' or 
intitule like 'SWDA,PCH_PRE,P61%' or 
intitule like 'SWDA,PCH_PRE,P62%' or 
intitule like 'SWDA,PCH_PRE,P7%' or 
intitule like 'SWDA,PCH_PRE,P71%' or 
intitule like 'SWDA,PCH_PRE,P72%' or 
intitule like 'WDA,PCH_PRE,B1GM%' or 
intitule like 'WDA,PCH_PRE,P6%' or 
intitule like 'WDA,PCH_PRE,P61%' or 
intitule like 'WDA,PCH_PRE,P62%' or 
intitule like 'WDA,PCH_PRE,P7%' or 
intitule like 'WDA,PCH_PRE,P71%' or 
intitule like 'WDA,PCH_PRE,P72 %' or 
intitule like 'NSA,PCH_SAME,B1GM%' or 
intitule like 'NSA,PCH_SAME,P6%' or 
intitule like 'NSA,PCH_SAME,P61%' or 
intitule like 'NSA,PCH_SAME,P62%' or 
intitule like 'NSA,PCH_SAME,P7%' or 
intitule like 'NSA,PCH_SAME,P71%' or 
intitule like 'NSA,PCH_SAME,P72%' or 
intitule like 'SA,PCH_SAME,B1GM%' or 
intitule like 'SA,PCH_SAME,P6%' or 
intitule like 'SA,PCH_SAME,P61%' or 
intitule like 'SA,PCH_SAME,P62%' or 
intitule like 'SA,PCH_SAME,P7%' or 
intitule like 'SA,PCH_SAME,P71%' or 
intitule like 'SA,PCH_SAME,P72%' or 
intitule like 'SWDA,PCH_SAME,B1GM%' or 
intitule like 'SWDA,PCH_SAME,P6%' or 
intitule like 'SWDA,PCH_SAME,P61%' or 
intitule like 'SWDA,PCH_SAME,P62%' or 
intitule like 'SWDA,PCH_SAME,P7%' or 
intitule like 'SWDA,PCH_SAME,P71%' or 
intitule like 'SWDA,PCH_SAME,P72%' or 
intitule like 'WDA,PCH_SAME,B1GM%' or 
intitule like 'WDA,PCH_SAME,P6%' or 
intitule like 'WDA,PCH_SAME,P61%' or 
intitule like 'WDA,PCH_SAME,P62%' or 
intitule like 'WDA,PCH_SAME,P7%' or 
intitule like 'WDA,PCH_SAME,P71%' or 
intitule like 'WDA,PCH_SAME,P72%' or 
intitule like 'NSA,MIO_EUR,N11%' or 
intitule like 'NSA,MIO_EUR,N11%' or 
intitule like 'NSA,MIO_EUR,N1111%' or 
intitule like 'NSA,MIO_EUR,N1112%' or 
intitule like 'NSA,MIO_EUR,N11131%' or 
intitule like 'NSA,MIO_EUR,N11132%' or 
intitule like 'NSA,MIO_EUR,N1114%' or 
intitule like 'NSA,MIO_EUR,N112%' or 
intitule like 'SA,MIO_EUR,N11%' or 
intitule like 'SA,MIO_EUR,N1111%' or 
intitule like 'SA,MIO_EUR,N1112%' or 
intitule like 'SA,MIO_EUR,N11131%' or 
intitule like 'SA,MIO_EUR,N11132%' or 
intitule like 'SA,MIO_EUR,N1114%' or 
intitule like 'SA,MIO_EUR,N112%' or 
intitule like 'SWDA,MIO_EUR,N11%' or 
intitule like 'SWDA,MIO_EUR,N1111%' or 
intitule like 'SWDA,MIO_EUR,N1112%' or 
intitule like 'SWDA,MIO_EUR,N11131%' or 
intitule like 'SWDA,MIO_EUR,N11132%' or 
intitule like 'SWDA,MIO_EUR,N1114%' or 
intitule like 'SWDA,MIO_EUR,N112%' or 
intitule like 'WDA,MIO_EUR,N11%' or 
intitule like 'WDA,MIO_EUR,N1111%' or 
intitule like 'WDA,MIO_EUR,N1112%' or 
intitule like 'WDA,MIO_EUR,N11131%' or 
intitule like 'WDA,MIO_EUR,N11132%' or 
intitule like 'WDA,MIO_EUR,N1114%' or 
intitule like 'WDA,MIO_EUR,N112%');

proc sql;
create table vars6&nopays
as 
select catt(nomvar) as var from dico&&pays&nopays
where (
intitule like 'NSA,PC_TOT,N11%' or 
intitule like 'NSA,PC_TOT,N11%' or 
intitule like 'NSA,PC_TOT,N1111%' or 
intitule like 'NSA,PC_TOT,N1112%' or 
intitule like 'NSA,PC_TOT,N11131%' or 
intitule like 'NSA,PC_TOT,N11132%' or 
intitule like 'NSA,PC_TOT,N1114%' or 
intitule like 'NSA,PC_TOT,N112%' or 
intitule like 'SA,PC_TOT,N11%' or 
intitule like 'SA,PC_TOT,N1111%' or 
intitule like 'SA,PC_TOT,N1112%' or 
intitule like 'SA,PC_TOT,N11131%' or 
intitule like 'SA,PC_TOT,N11132%' or 
intitule like 'SA,PC_TOT,N1114%' or 
intitule like 'SA,PC_TOT,N112%' or 
intitule like 'SWDA,PC_TOT,N11%' or 
intitule like 'SWDA,PC_TOT,N1111%' or 
intitule like 'SWDA,PC_TOT,N1112%' or 
intitule like 'SWDA,PC_TOT,N11131%' or 
intitule like 'SWDA,PC_TOT,N11132%' or 
intitule like 'SWDA,PC_TOT,N1114%' or 
intitule like 'SWDA,PC_TOT,N112%' or 
intitule like 'WDA,PC_TOT,N11%' or 
intitule like 'WDA,PC_TOT,N1111%' or 
intitule like 'WDA,PC_TOT,N1112%' or 
intitule like 'WDA,PC_TOT,N11131%' or 
intitule like 'WDA,PC_TOT,N11132%' or 
intitule like 'WDA,PC_TOT,N1114%' or 
intitule like 'WDA,PC_TOT,N112%' or 
intitule like 'NSA,I2000,N11%' or 
intitule like 'NSA,I2000,N11%' or 
intitule like 'NSA,I2000,N1111%' or 
intitule like 'NSA,I2000,N1112%' or 
intitule like 'NSA,I2000,N11131%' or 
intitule like 'NSA,I2000,N11132%' or 
intitule like 'NSA,I2000,N1114%' or 
intitule like 'NSA,I2000,N112%' or 
intitule like 'SA,I2000,N11%' or 
intitule like 'SA,I2000,N1111%' or 
intitule like 'SA,I2000,N1112%' or 
intitule like 'SA,I2000,N11131%' or 
intitule like 'SA,I2000,N11132%' or 
intitule like 'SA,I2000,N1114%' or 
intitule like 'SA,I2000,N112%' or 
intitule like 'SWDA,I2000,N11%' or 
intitule like 'SWDA,I2000,N1111%' or 
intitule like 'SWDA,I2000,N1112%' or 
intitule like 'SWDA,I2000,N11131%' or 
intitule like 'SWDA,I2000,N11132%' or 
intitule like 'SWDA,I2000,N1114%' or 
intitule like 'SWDA,I2000,N112%' or 
intitule like 'WDA,I2000,N11%' or 
intitule like 'WDA,I2000,N1111%' or 
intitule like 'WDA,I2000,N1112%' or 
intitule like 'WDA,I2000,N11131%' or 
intitule like 'WDA,I2000,N11132%' or 
intitule like 'WDA,I2000,N1114%' or 
intitule like 'WDA,I2000,N112%' or 
intitule like 'NSA,MIO_EUR_CLV2000,N11%' or 
intitule like 'NSA,MIO_EUR_CLV2000,N11%' or 
intitule like 'NSA,MIO_EUR_CLV2000,N1111%' or 
intitule like 'NSA,MIO_EUR_CLV2000,N1112%' or 
intitule like 'NSA,MIO_EUR_CLV2000,N11131%' or 
intitule like 'NSA,MIO_EUR_CLV2000,N11132%' or 
intitule like 'NSA,MIO_EUR_CLV2000,N1114%' or 
intitule like 'NSA,MIO_EUR_CLV2000,N112%' or 
intitule like 'SA,MIO_EUR_CLV2000,N11%' or 
intitule like 'SA,MIO_EUR_CLV2000,N1111%' or 
intitule like 'SA,MIO_EUR_CLV2000,N1112%' or 
intitule like 'SA,MIO_EUR_CLV2000,N11131%' or 
intitule like 'SA,MIO_EUR_CLV2000,N11132%' or 
intitule like 'SA,MIO_EUR_CLV2000,N1114%' or 
intitule like 'SA,MIO_EUR_CLV2000,N112%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,N11%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,N1111%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,N1112%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,N11131%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,N11132%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,N1114%' or 
intitule like 'SWDA,MIO_EUR_CLV2000,N112%' or 
intitule like 'WDA,MIO_EUR_CLV2000,N11%' or 
intitule like 'WDA,MIO_EUR_CLV2000,N1111%' or 
intitule like 'WDA,MIO_EUR_CLV2000,N1112%' or 
intitule like 'WDA,MIO_EUR_CLV2000,N11131%' or 
intitule like 'WDA,MIO_EUR_CLV2000,N11132%' or 
intitule like 'WDA,MIO_EUR_CLV2000,N1114%' or 
intitule like 'WDA,MIO_EUR_CLV2000,N112%' or 
intitule like 'NSA,MIO_EUR_CLV2005,N11%' or 
intitule like 'NSA,MIO_EUR_CLV2005,N11%' or 
intitule like 'NSA,MIO_EUR_CLV2005,N1111%' or 
intitule like 'NSA,MIO_EUR_CLV2005,N1112%' or 
intitule like 'NSA,MIO_EUR_CLV2005,N11131%' or 
intitule like 'NSA,MIO_EUR_CLV2005,N11132%' or 
intitule like 'NSA,MIO_EUR_CLV2005,N1114%' or 
intitule like 'NSA,MIO_EUR_CLV2005,N112%' or 
intitule like 'SA,MIO_EUR_CLV2005,N11%' or 
intitule like 'SA,MIO_EUR_CLV2005,N1111%' or 
intitule like 'SA,MIO_EUR_CLV2005,N1112%' or 
intitule like 'SA,MIO_EUR_CLV2005,N11131%' or 
intitule like 'SA,MIO_EUR_CLV2005,N11132%' or 
intitule like 'SA,MIO_EUR_CLV2005,N1114%' or 
intitule like 'SA,MIO_EUR_CLV2005,N112%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,N11%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,N1111%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,N1112%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,N11131%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,N11132%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,N1114%' or 
intitule like 'SWDA,MIO_EUR_CLV2005,N112%' or 
intitule like 'WDA,MIO_EUR_CLV2005,N11%' or 
intitule like 'WDA,MIO_EUR_CLV2005,N1111%' or 
intitule like 'WDA,MIO_EUR_CLV2005,N1112%' or 
intitule like 'WDA,MIO_EUR_CLV2005,N11131%' or 
intitule like 'WDA,MIO_EUR_CLV2005,N11132%' or 
intitule like 'WDA,MIO_EUR_CLV2005,N1114%' or 
intitule like 'WDA,MIO_EUR_CLV2005,N112%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,N11%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,N11%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,N1111%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,N1112%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,N11131%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,N11132%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,N1114%' or 
intitule like 'NSA,MIO_EUR_KP_PRE,N112%' or 
intitule like 'SA,MIO_EUR_KP_PRE,N11%' or 
intitule like 'SA,MIO_EUR_KP_PRE,N1111%' or 
intitule like 'SA,MIO_EUR_KP_PRE,N1112%' or 
intitule like 'SA,MIO_EUR_KP_PRE,N11131%' or 
intitule like 'SA,MIO_EUR_KP_PRE,N11132%' or 
intitule like 'SA,MIO_EUR_KP_PRE,N1114%' or 
intitule like 'SA,MIO_EUR_KP_PRE,N112%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,N11%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,N1111%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,N1112%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,N11131%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,N11132%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,N1114%' or 
intitule like 'SWDA,MIO_EUR_KP_PRE,N112%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,N11%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,N1111%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,N1112%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,N11131%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,N11132%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,N1114%' or 
intitule like 'WDA,MIO_EUR_KP_PRE,N112%' or 
intitule like 'NSA,MIO_NAC_CLV2000,N11%' or 
intitule like 'NSA,MIO_NAC_CLV2000,N11%' or 
intitule like 'NSA,MIO_NAC_CLV2000,N1111%' or 
intitule like 'NSA,MIO_NAC_CLV2000,N1112%' or 
intitule like 'NSA,MIO_NAC_CLV2000,N11131%' or 
intitule like 'NSA,MIO_NAC_CLV2000,N11132%' or 
intitule like 'NSA,MIO_NAC_CLV2000,N1114%' or 
intitule like 'NSA,MIO_NAC_CLV2000,N112%' or 
intitule like 'SA,MIO_NAC_CLV2000,N11%' or 
intitule like 'SA,MIO_NAC_CLV2000,N1111%' or 
intitule like 'SA,MIO_NAC_CLV2000,N1112%' or 
intitule like 'SA,MIO_NAC_CLV2000,N11131%' or 
intitule like 'SA,MIO_NAC_CLV2000,N11132%' or 
intitule like 'SA,MIO_NAC_CLV2000,N1114%' or 
intitule like 'SA,MIO_NAC_CLV2000,N112%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,N11%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,N1111%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,N1112%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,N11131%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,N11132%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,N1114%' or 
intitule like 'SWDA,MIO_NAC_CLV2000,N112%' or 
intitule like 'WDA,MIO_NAC_CLV2000,N11%' or 
intitule like 'WDA,MIO_NAC_CLV2000,N1111%' or 
intitule like 'WDA,MIO_NAC_CLV2000,N1112%' or 
intitule like 'WDA,MIO_NAC_CLV2000,N11131%' or 
intitule like 'WDA,MIO_NAC_CLV2000,N11132%' or 
intitule like 'WDA,MIO_NAC_CLV2000,N1114%' or 
intitule like 'WDA,MIO_NAC_CLV2000,N112%' or 
intitule like 'NSA,MIO_NAC_CLV2005,N11%' or 
intitule like 'NSA,MIO_NAC_CLV2005,N11%' or 
intitule like 'NSA,MIO_NAC_CLV2005,N1111%' or 
intitule like 'NSA,MIO_NAC_CLV2005,N1112%' or 
intitule like 'NSA,MIO_NAC_CLV2005,N11131%' or 
intitule like 'NSA,MIO_NAC_CLV2005,N11132%' or 
intitule like 'NSA,MIO_NAC_CLV2005,N1114%' or 
intitule like 'NSA,MIO_NAC_CLV2005,N112%' or 
intitule like 'SA,MIO_NAC_CLV2005,N11%' or 
intitule like 'SA,MIO_NAC_CLV2005,N1111%' or 
intitule like 'SA,MIO_NAC_CLV2005,N1112%' or 
intitule like 'SA,MIO_NAC_CLV2005,N11131%' or 
intitule like 'SA,MIO_NAC_CLV2005,N11132%' or 
intitule like 'SA,MIO_NAC_CLV2005,N1114%' or 
intitule like 'SA,MIO_NAC_CLV2005,N112%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,N11%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,N1111%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,N1112%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,N11131%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,N11132%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,N1114%' or 
intitule like 'SWDA,MIO_NAC_CLV2005,N112%' or 
intitule like 'WDA,MIO_NAC_CLV2005,N11%' or 
intitule like 'WDA,MIO_NAC_CLV2005,N1111%' or 
intitule like 'WDA,MIO_NAC_CLV2005,N1112%' or 
intitule like 'WDA,MIO_NAC_CLV2005,N11131%' or 
intitule like 'WDA,MIO_NAC_CLV2005,N11132%' or 
intitule like 'WDA,MIO_NAC_CLV2005,N1114%' or 
intitule like 'WDA,MIO_NAC_CLV2005,N112%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,N11%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,N11%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,N1111%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,N1112%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,N11131%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,N11132%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,N1114%' or 
intitule like 'NSA,MIO_NAC_KP_PRE,N112%' or 
intitule like 'SA,MIO_NAC_KP_PRE,N11%' or 
intitule like 'SA,MIO_NAC_KP_PRE,N1111%' or 
intitule like 'SA,MIO_NAC_KP_PRE,N1112%' or 
intitule like 'SA,MIO_NAC_KP_PRE,N11131%' or 
intitule like 'SA,MIO_NAC_KP_PRE,N11132%' or 
intitule like 'SA,MIO_NAC_KP_PRE,N1114%' or 
intitule like 'SA,MIO_NAC_KP_PRE,N112%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,N11%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,N1111%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,N1112%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,N11131%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,N11132%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,N1114%' or 
intitule like 'SWDA,MIO_NAC_KP_PRE,N112%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,N11%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,N1111%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,N1112%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,N11131%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,N11132%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,N1114%' or 
intitule like 'WDA,MIO_NAC_KP_PRE,N112%' or 
intitule like 'NSA,PCH_PRE,N11%' or 
intitule like 'NSA,PCH_PRE,N11%' or 
intitule like 'NSA,PCH_PRE,N1111%' or 
intitule like 'NSA,PCH_PRE,N1112%' or 
intitule like 'NSA,PCH_PRE,N11131%' or 
intitule like 'NSA,PCH_PRE,N11132%' or 
intitule like 'NSA,PCH_PRE,N1114%' or 
intitule like 'NSA,PCH_PRE,N112%' or 
intitule like 'SA,PCH_PRE,N11%' or 
intitule like 'SA,PCH_PRE,N1111%' or 
intitule like 'SA,PCH_PRE,N1112%' or 
intitule like 'SA,PCH_PRE,N11131%' or 
intitule like 'SA,PCH_PRE,N11132%' or 
intitule like 'SA,PCH_PRE,N1114%' or 
intitule like 'SA,PCH_PRE,N112%' or 
intitule like 'SWDA,PCH_PRE,N11%' or 
intitule like 'SWDA,PCH_PRE,N1111%' or 
intitule like 'SWDA,PCH_PRE,N1112%' or 
intitule like 'SWDA,PCH_PRE,N11131%' or 
intitule like 'SWDA,PCH_PRE,N11132%' or 
intitule like 'SWDA,PCH_PRE,N1114%' or 
intitule like 'SWDA,PCH_PRE,N112%' or 
intitule like 'WDA,PCH_PRE,N11%' or 
intitule like 'WDA,PCH_PRE,N1111%' or 
intitule like 'WDA,PCH_PRE,N1112%' or 
intitule like 'WDA,PCH_PRE,N11131%' or 
intitule like 'WDA,PCH_PRE,N11132%' or 
intitule like 'WDA,PCH_PRE,N1114%' or 
intitule like 'WDA,PCH_PRE,N112%' or 
intitule like 'NSA,PCH_SAME,N11%' or 
intitule like 'NSA,PCH_SAME,N11%' or 
intitule like 'NSA,PCH_SAME,N1111%' or 
intitule like 'NSA,PCH_SAME,N1112%' or 
intitule like 'NSA,PCH_SAME,N11131%' or 
intitule like 'NSA,PCH_SAME,N11132%' or 
intitule like 'NSA,PCH_SAME,N1114%' or 
intitule like 'NSA,PCH_SAME,N112%' or 
intitule like 'SA,PCH_SAME,N11%' or 
intitule like 'SA,PCH_SAME,N1111%' or 
intitule like 'SA,PCH_SAME,N1112%' or 
intitule like 'SA,PCH_SAME,N11131%' or 
intitule like 'SA,PCH_SAME,N11132%' or 
intitule like 'SA,PCH_SAME,N1114%' or 
intitule like 'SA,PCH_SAME,N112%' or 
intitule like 'SWDA,PCH_SAME,N11%' or 
intitule like 'SWDA,PCH_SAME,N1111%' or 
intitule like 'SWDA,PCH_SAME,N1112%' or 
intitule like 'SWDA,PCH_SAME,N11131%' or 
intitule like 'SWDA,PCH_SAME,N11132%' or 
intitule like 'SWDA,PCH_SAME,N1114%' or 
intitule like 'SWDA,PCH_SAME,N112%' or 
intitule like 'WDA,PCH_SAME,N11%' or 
intitule like 'WDA,PCH_SAME,N1111%' or 
intitule like 'WDA,PCH_SAME,N1112%' or 
intitule like 'WDA,PCH_SAME,N11131%' or 
intitule like 'WDA,PCH_SAME,N11132%' or 
intitule like 'WDA,PCH_SAME,N1114%' or 
intitule like 'WDA,PCH_SAME,N112%');

proc sql;
create table vars7&nopays
as 
select catt(nomvar) as var from dico&&pays&nopays
where (
intitule like 'NSA,CPI00_EUR,N11%' or 
intitule like 'NSA,CPI00_EUR,N1111%' or 
intitule like 'NSA,CPI00_EUR,N1112%' or 
intitule like 'NSA,CPI00_EUR,N11131%' or 
intitule like 'NSA,CPI00_EUR,N11132%' or 
intitule like 'NSA,CPI00_EUR,N1114%' or 
intitule like 'NSA,CPI00_EUR,N112%' or 
intitule like 'SA,CPI00_EUR,N11%' or 
intitule like 'SA,CPI00_EUR,N1111%' or 
intitule like 'SA,CPI00_EUR,N1112%' or 
intitule like 'SA,CPI00_EUR,N11131%' or 
intitule like 'SA,CPI00_EUR,N11132%' or 
intitule like 'SA,CPI00_EUR,N1114%' or 
intitule like 'SA,CPI00_EUR,N112%' or 
intitule like 'SWDA,CPI00_EUR,N11%' or 
intitule like 'SWDA,CPI00_EUR,N1111%' or 
intitule like 'SWDA,CPI00_EUR,N1112%' or 
intitule like 'SWDA,CPI00_EUR,N11131%' or 
intitule like 'SWDA,CPI00_EUR,N11132%' or 
intitule like 'SWDA,CPI00_EUR,N1114%' or 
intitule like 'SWDA,CPI00_EUR,N112%' or 
intitule like 'WDA,CPI00_EUR,N11%' or 
intitule like 'WDA,CPI00_EUR,N1111%' or 
intitule like 'WDA,CPI00_EUR,N1112%' or 
intitule like 'WDA,CPI00_EUR,N11131%' or 
intitule like 'WDA,CPI00_EUR,N11132%' or 
intitule like 'WDA,CPI00_EUR,N1114%' or 
intitule like 'WDA,CPI00_EUR,N112%' or 
intitule like 'NSA,CPI00_NAC,N11%' or 
intitule like 'NSA,CPI00_NAC,N11%' or 
intitule like 'NSA,CPI00_NAC,N1111%' or 
intitule like 'NSA,CPI00_NAC,N1112%' or 
intitule like 'NSA,CPI00_NAC,N11131%' or 
intitule like 'NSA,CPI00_NAC,N11132%' or 
intitule like 'NSA,CPI00_NAC,N1114%' or 
intitule like 'NSA,CPI00_NAC,N112%' or 
intitule like 'SA,CPI00_NAC,N11%' or 
intitule like 'SA,CPI00_NAC,N1111%' or 
intitule like 'SA,CPI00_NAC,N1112%' or 
intitule like 'SA,CPI00_NAC,N11131%' or 
intitule like 'SA,CPI00_NAC,N11132%' or 
intitule like 'SA,CPI00_NAC,N1114%' or 
intitule like 'SA,CPI00_NAC,N112%' or 
intitule like 'SWDA,CPI00_NAC,N11%' or 
intitule like 'SWDA,CPI00_NAC,N1111%' or 
intitule like 'SWDA,CPI00_NAC,N1112%' or 
intitule like 'SWDA,CPI00_NAC,N11131%' or 
intitule like 'SWDA,CPI00_NAC,N11132%' or 
intitule like 'SWDA,CPI00_NAC,N1114%' or 
intitule like 'SWDA,CPI00_NAC,N112%' or 
intitule like 'WDA,CPI00_NAC,N11%' or 
intitule like 'WDA,CPI00_NAC,N1111%' or 
intitule like 'WDA,CPI00_NAC,N1112%' or 
intitule like 'WDA,CPI00_NAC,N11131%' or 
intitule like 'WDA,CPI00_NAC,N11132%' or 
intitule like 'WDA,CPI00_NAC,N1114%' or 
intitule like 'WDA,CPI00_NAC,N112%' or 
intitule like 'NSA,CPI05_EUR,N11%' or 
intitule like 'NSA,CPI05_EUR,N11%' or 
intitule like 'NSA,CPI05_EUR,N1111%' or 
intitule like 'NSA,CPI05_EUR,N1112%' or 
intitule like 'NSA,CPI05_EUR,N11131%' or 
intitule like 'NSA,CPI05_EUR,N11132%' or 
intitule like 'NSA,CPI05_EUR,N1114%' or 
intitule like 'NSA,CPI05_EUR,N112%' or 
intitule like 'SA,CPI05_EUR,N11%' or 
intitule like 'SA,CPI05_EUR,N1111%' or 
intitule like 'SA,CPI05_EUR,N1112%' or 
intitule like 'SA,CPI05_EUR,N11131%' or 
intitule like 'SA,CPI05_EUR,N11132%' or 
intitule like 'SA,CPI05_EUR,N1114%' or 
intitule like 'SA,CPI05_EUR,N112%' or 
intitule like 'SWDA,CPI05_EUR,N11%' or 
intitule like 'SWDA,CPI05_EUR,N1111%' or 
intitule like 'SWDA,CPI05_EUR,N1112%' or 
intitule like 'SWDA,CPI05_EUR,N11131%' or 
intitule like 'SWDA,CPI05_EUR,N11132%' or 
intitule like 'SWDA,CPI05_EUR,N1114%' or 
intitule like 'SWDA,CPI05_EUR,N112%' or 
intitule like 'WDA,CPI05_EUR,N11%' or 
intitule like 'WDA,CPI05_EUR,N1111%' or 
intitule like 'WDA,CPI05_EUR,N1112%' or 
intitule like 'WDA,CPI05_EUR,N11131%' or 
intitule like 'WDA,CPI05_EUR,N11132%' or 
intitule like 'WDA,CPI05_EUR,N1114%' or 
intitule like 'WDA,CPI05_EUR,N112%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,N11%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,N11%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,N1111%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,N1112%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,N11131%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,N11132%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,N1114%' or 
intitule like 'NSA,PCH_PRE_CPI05_EUR,N112%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,N11%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,N1111%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,N1112%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,N11131%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,N11132%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,N1114%' or 
intitule like 'SA,PCH_PRE_CPI05_EUR,N112%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,N11%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,N1111%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,N1112%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,N11131%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,N11132%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,N1114%' or 
intitule like 'SWDA,PCH_PRE_CPI05_EUR,N112%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,N11%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,N1111%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,N1112%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,N11131%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,N11132%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,N1114%' or 
intitule like 'WDA,PCH_PRE_CPI05_EUR,N112%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,N11%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,N11%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,N1111%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,N1112%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,N11131%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,N11132%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,N1114%' or 
intitule like 'NSA,PCH_PRE_CPI05_NAC,N112%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,N11%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,N1111%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,N1112%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,N11131%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,N11132%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,N1114%' or 
intitule like 'SA,PCH_PRE_CPI05_NAC,N112%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,N11%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,N1111%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,N1112%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,N11131%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,N11132%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,N1114%' or 
intitule like 'SWDA,PCH_PRE_CPI05_NAC,N112%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,N11%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,N1111%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,N1112%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,N11131%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,N11132%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,N1114%' or 
intitule like 'WDA,PCH_PRE_CPI05_NAC,N112%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,N11%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,N11%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,N1111%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,N1112%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,N11131%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,N11132%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,N1114%' or 
intitule like 'NSA,PCH_SAME_CPI05_EUR,N112%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,N11%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,N1111%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,N1112%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,N11131%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,N11132%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,N1114%' or 
intitule like 'SA,PCH_SAME_CPI05_EUR,N112%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,N11%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,N1111%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,N1112%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,N11131%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,N11132%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,N1114%' or 
intitule like 'SWDA,PCH_SAME_CPI05_EUR,N112%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,N11%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,N1111%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,N1112%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,N11131%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,N11132%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,N1114%' or 
intitule like 'WDA,PCH_SAME_CPI05_EUR,N112%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,N11%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,N11%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,N1111%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,N1112%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,N11131%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,N11132%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,N1114%' or 
intitule like 'NSA,PCH_SAME_CPI05_NAC,N112%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,N11%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,N1111%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,N1112%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,N11131%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,N11132%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,N1114%' or 
intitule like 'SA,PCH_SAME_CPI05_NAC,N112%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,N11%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,N1111%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,N1112%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,N11131%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,N11132%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,N1114%' or 
intitule like 'SWDA,PCH_SAME_CPI05_NAC,N112%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,N11%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,N1111%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,N1112%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,N11131%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,N11132%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,N1114%' or 
intitule like 'WDA,PCH_SAME_CPI05_NAC,N112%');

proc sql;
create table varsA&nopays as select var from vars1&nopays;

proc sql;
insert into varsA&nopays select var from vars2&nopays where var not in (select var from vars1&nopays);

proc sql;
insert into varsA&nopays select var from vars3&nopays where var not in (select var from vars2&nopays);

proc sql;
insert into varsA&nopays select var from vars4&nopays where var not in (select var from vars3&nopays);

proc sql;
insert into varsA&nopays select var from vars4&nopays where var not in (select var from vars3&nopays);

proc sql;
insert into varsA&nopays select var from vars5&nopays where var not in (select var from vars4&nopays);

proc sql;
insert into varsA&nopays select var from vars6&nopays where var not in (select var from vars5&nopays);

proc sql;
insert into varsA&nopays select var from vars7&nopays where var not in (select var from vars6&nopays);


filename tempf temp;

data _null_;
   file tempf;
   set varsA&nopays end=lastobs;
   if _n_=1 then put "data a&&pays&nopays;set in1.a&&pays&nopays (drop=";
   put var /;
   if lastobs then put ");run;";
run;

%inc tempf;

filename tempf clear;

proc sql;
delete from dico&&pays&nopays where nomvar in (select var from varsA&nopays);

proc sql;
select memname into :vartabname separated by ' ' from dictionary.tables where libname=upcase('work')
and memname like 'VARS%';
quit;

%put vartabname: &vartabname;

proc datasets library = work;
    DELETE &vartabname;
run;

/* debut pour supprimer les valeurs redondantes dans le dico et dans les tables pays */


proc sql;
create table redundant1&&pays&nopays 
as select min(nomvar) as nomvar,count(intitule) as compte
from dico&&pays&nopays
group by intitule
having count(intitule) > 1;

filename tempf temp;

data _null_;
   file tempf;
   set redundant1&&pays&nopays end=lastobs;
   if _n_=1 then put "data a&&pays&nopays;set a&&pays&nopays (drop=";
   put nomvar /;
   if lastobs then put ");run;";
run;

%inc tempf;

filename tempf clear;

proc sql;
delete from dico&&pays&nopays where nomvar in (select nomvar from redundant1&&pays&nopays);


proc sql;
create table redundant2&&pays&nopays  
as select min(nomvar) as nomvar,count(intitule) as compte
from dico&&pays&nopays
group by intitule
having count(intitule) > 1;

filename tempf temp;

data _null_;
   file tempf;
   set redundant2&&pays&nopays end=lastobs;
   if _n_=1 then put "data a&&pays&nopays;set a&&pays&nopays (drop=";
   put nomvar /;
   if lastobs then put ");run;";
run;

%inc tempf;

filename tempf clear;

proc sql;
delete from dico&&pays&nopays where nomvar in (select nomvar from redundant2&&pays&nopays);

proc sql;
select memname into :vartabname separated by ' ' from dictionary.tables where libname=upcase('work')
and memname like 'REDUN%';
quit;

%put vartabname: &vartabname;

proc datasets library = work;
    DELETE &vartabname;
run;

/* fin pour supprimer les valeurs redondantes dans le dico et dans les tables pays */


/* debut pour les variables avec uniquement des valeurs manquantes */

proc means data=a&&pays&nopays  noprint;
output out=atta(drop=_:) n=;

proc transpose data=atta out=atta (rename=(_name_=nomvar));
run;

proc sql;
delete from atta where col1 ne 0;

data atta;
set atta;
run;

filename tempf temp;

data _null_;
   file tempf;
   set atta end=lastobs;
   if _n_=1 then put "data a&&pays&nopays ;set a&&pays&nopays  (drop=";
   put nomvar /;
   if lastobs then put ");run;";
run;

%inc tempf;

filename tempf clear;

proc sql;
delete from dico&&pays&nopays where nomvar in (select nomvar from atta);

proc datasets library = work;
    DELETE atta;
run;


/* fin pour les variables avec uniquement des valeurs manquantes */

/* debut pour les variables avec plus de 474 mois avec des valeurs manquantes */
 
proc means data=a&&pays&nopays nmiss stackodsoutput; 
ods output summary=missing&&pays&nopays;
run;
ods output close;



proc sql;
create table intit1_&&pays&nopays as select di.intitule,mi.nmiss from dico&&pays&nopays di inner join missing&&pays&nopays mi on 
mi.variable = di.nomvar
where mi.nmiss>474;

proc sql;
create table intit2_&&pays&nopays as select di.nomvar as nomvar from dico&&pays&nopays di inner join missing&&pays&nopays mi on 
mi.variable = di.nomvar
where mi.nmiss>474;

filename tempf temp;

data _null_;
   file tempf;
   set intit2_&&pays&nopays end=lastobs;
   if _n_=1 then put "data a&&pays&nopays;set a&&pays&nopays (drop=";
   put nomvar /;
   if lastobs then put ");run;";
run;

%inc tempf;

filename tempf clear;

proc sql;
delete from dico&&pays&nopays where nomvar in (select nomvar from intit2_&&pays&nopays);


proc sql;
select memname into :vartabname separated by ' ' from dictionary.tables where libname=upcase('work')
and (memname like 'INTIT2_%' or memname like 'MISSING%');
quit;

%put vartabname: &vartabname;

proc datasets library = work;
    DELETE &vartabname;
run;

/* fin pour les variables avec plus de 474 mois avec des valeurs manquantes */

/* on sauvegarde les fichiers dans in2 */

data in2.a&&pays&nopays; set a&&pays&nopays; run;
data in2.dico&&pays&nopays; set dico&&pays&nopays; run;

%end;

%mend;

%dropcolsql;


/*
proc printto;
run;

proc sql;
select var6171 from afr;

proc sql;
select * from afr where nomvar='var6171';

ods output summary=toto; 
ods listing close; 
proc means data=afr nmiss stackodsoutput;
run;
ods output close;

*/


