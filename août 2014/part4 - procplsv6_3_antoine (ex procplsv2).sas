
/* on met today pour avoir la date sous forme yyyymmdd */
/*
%let today=%sysfunc(today(),yymmddn8.);

libname in3 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\dico3"  ;

libname in4 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\dico4"  ;

proc printto log="C:\travail\etudes\projetpib\docs\p4_&today._v2.log" new;
*/

libname in1 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\dico1"  ;

libname in3 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\dico3"  ;

libname in4 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\dico4"  ;

proc printto  ; /*log="C:\travail\etudes\projetpib\docs\p4_20140731_v2.log" new;*/

data calendeuro; set in1.calendeuro;run;
data calendocde; set in1.calendocde;run;
  
%macro lapls;
  
/*options SOURCE SOURCE2 MACROGEN SYMBOLGEN MLOGIC MPRINT;*/
 
/* 1ere partie */ 

%let pays1=FR ; %let pays2=DE ; %let pays3=UK; %let pays4=IT;%let pays5=ES; %let pays6=DK ;%let pays7=AT ; %let pays8=EE; %let pays9=IE; %let pays10=EL; %let pays11=CZ ; %let pays12=HR;  %let pays13=BG; %let pays14=CY; 
%let pays15=LV; %let pays16=LT; %let pays17=LU; %let pays18=HU; %let pays19=MT; %let pays20=NL; %let pays21=PL; %let pays22=PT; %let pays23=RO; %let pays24=SI; %let pays25=SK; %let pays26=FI; %let pays27=SE;  %let pays28=BE ; 

/* variables pour 28 pays */

/* test: necessite de changer le l pour le(s) pays concerne (s) */
%do l=1 %to 1/*5*/ ;/*ok*/

/* 1) On cree la table de resultat pour le pays en question */

data a&&pays&l.._res ; 
run ; 

/*01*/

data dico&&pays&l;
  set in3.dico&&pays&l;
  today="12Jan2014"d;
  if ajoutdate=777 then date_publi=intnx('weekday',intnx('month',today,-1,'E'),-1);
  else if label_eu_oc in ("euro","ocde") then date_publi=intnx('weekday',intnx('month',today,-1,'E'),-1);
  else 
  do i=1 by 1 until (date_publi<today);
    date_publi=intnx(periode,today,-1*i,'E')+ajoutdate;
  end;
  drop i;
  format date_publi today date9.;
run;

data dico&&pays&l;
set dico&&pays&l;
date_publi=date_publi+30;
if date_publi > today then dispo=0; else dispo=1; 
run;


data dico&&pays&l ; set dico&&pays&l ;
res=find(intitule,",&&pays&l")  ;
if res gt 0 ;
run ;

data dico&&pays&l ; set dico&&pays&l ;
call symput("nvar&&pays&l",trim(left(_n_))) ;
run; 

data dico&&pays&l ; set dico&&pays&l ;
if intitule eq "SWDA,MIO_EUR_CLV2005,B1GM,&&pays&l" then call symput("i_pib",trim(left(_n_))) ;
%do i=1 %to &&&&nvar&&pays&l ;
if _n_ eq &i then call symput("var&&pays&l.._&i",trim(left(nomvar))) ;
if _n_ eq &i then call symput("idispo_1_&i",trim(left(dispo))); 
%end ;
run ;



/*options nonotes ;*/

%do la=0 %to 0 ;/*5 */
 
%do lb=0 %to 0;/*5 */

data date ; set in3.a&&pays&l ; 
if year(nouv_date) eq 2014 and month(nouv_date) eq 7 ; 
keep nouv_date ; 
run ; 


data a ; 
if _n_ eq 1 then set date (rename=(nouv_date=date_prev)) ; 
set in3.a&&pays&l;  
annee=year(nouv_date) ; 
qtr=qtr(nouv_date) ;
ann_prev=year(date_prev) ;  
qtr_prev=qtr(date_prev) ; 
/*pour les 5 mois*/
%do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; 
format varnum_&i._&j 10.3 ; 
varnum_&i._&j=&&&&var&&pays&l.._&i.._t&j; %end ; %end; 
act_pib= &&&&var&&pays&l.._&i_pib.._t0 ; 
if nouv_date ge date_prev then &&&&var&&pays&l.._&i_pib.._t0=. ; 
run ; 


proc summary data=a ; ;
var %do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; varnum_&i._&j %end ; %end ;  ; 
output out=min min=%do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; min_varnum_&i._&j %end ; %end ; ; 
run;

data a ; if _n_ eq 1 then set min ; 
set a   ; 
run ; 

data a ; set a ; 
%do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; 
if min_varnum_&i._&j lt 0 then
varnum_&i._&j=varnum_&i._&j-min_varnum_&i._&j ; 
if varnum_&i._&j eq 0 then varnum_&i._&j=0.0001 ; 
%end ; %end; 
run  ; 

proc summary nway ; id qtr_prev ann_prev ; 
class annee qtr ; 
var act_pib &&&&var&&pays&l.._&i_pib.._t0 
%do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; 
%if &i ne &i_pib or &j ne 0 %then %do  ; 
varnum_&i._&j %end ; %end; %end ; ;
output out=a mean= ; 
run ; 

proc sort data=a  ; by descending annee descending qtr ; 
run ; 

proc sort data=a ; by annee qtr ; 
run ; 

data a ; set a ; 
%if &la eq 0 %then %do ; 
l&&&&var&&pays&l.._&i_pib.._t0=log(&&&&var&&pays&l.._&i_pib.._t0) ; %end ; 
%if &la ge 1 %then %do ; 
l&&&&var&&pays&l.._&i_pib.._t0=exp(&la/5*log(&&&&var&&pays&l.._&i_pib.._t0))/(&la/5) ; 
%end ; 
%do j=0 %to 5 ;
%do i=1 %to &&&&nvar&&pays&l ; 
%if &i ne &i_pib or &j ne 0 %then %do  ; 
%if &lb eq 0 %then %do ; 
lvarnum_&i._&j=log(varnum_&i._&j ) ; 
%end ; 
%if &lb ge 1 %then %do ; 
lvarnum_&i._&j=exp(&lb/5*log(varnum_&i._&j))/(&lb/5) ; 
%end ; 
%end ; 
%end ; 
%end ; 
run ; 

/*ok*/
%do f=1 %to 1;/*  10*/



%do u=1 %to 4; /* 5*/
%put &l &la &lb &u &f ;

 
proc pls data=a noprint nfac=&f ;
model l&&&&var&&pays&l.._&i_pib.._t0 =
%do j=&u %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; 
%if (&i ne &i_pib or &j ne 0) %then %do ; 
%if  &&&&idispo_1_&i eq 0 %then %do  ; 
lvarnum_&i._&j %end ; %end; %end ; %end ;  ;
output out=a1_1_res&u predicted=prev_pib ; 
  run;

data a_res&u ; set a1_1_res&u (in=e1);
if e1 then nvar=1;
%if &la eq 0 %then %do ; prev_pib=exp(prev_pib) ; %end ; 
%if &la ge 1 %then %do ; 
if prev_pib gt 0 then prev_pib=exp(log((&la/5)*prev_pib)/(&la/5)) ; else delete ; 
%end ; 
run ; 


data a_res&u ; set a_res&u ; 
if (annee lt ann_prev) or (annee eq ann_prev and qtr lt qtr_prev) then prev_pib=act_pib ; 
delta_pib=(act_pib-lag(act_pib))/lag(act_pib) ; 
edelta_pib=(prev_pib-lag(prev_pib))/lag(prev_pib) ; 
run ; 

data a_res&u ; set a_res&u ; 
if (annee gt ann_prev) or (annee eq ann_prev and qtr ge qtr_prev) ;
run ; 

/*02*/
data a_res&u ; set a_res&u ; 
format model $50. ; 
if nvar eq 1 then model="model1_&u._&la._&lb._&f      " ;
hprev=_n_ ; 
if hprev le 4 ; 
run ; 

data a&&pays&l.._res ; set a&&pays&l.._res a_res&u  ; 
run;

%end ; 
%end ; 
%end ; 
%end ; 

data a&&pays&l.._res ; set a&&pays&l.._res ;
if hprev ne . ; 
delta=abs(delta_pib-edelta_pib) ; 
run ; 


proc sort data=a&&pays&l.._res  out=a&&pays&l.._res ; 
by annee qtr hprev delta ; run ; 

proc print data=a&&pays&l.._res  ;
var annee qtr model hprev delta delta_pib edelta_pib prev_pib act_pib ; 
run ; 

data in4.a&&pays&l.._res ; set a&&pays&l.._res ;run;

%end;

%mend ;

%lapls;
/*
proc printto;
run;
proc sql;
update dicofr set dispo=0 where ajoutdate=777 and periode="m";
select name from dictionary.columns where memname=upcase('a');
quit;

*/





