/* changer le libname et le log */
/* penser a  enlever MT, HR et CY si pas encore de choix */
/* et penser a changer   %do l=1 %to 28 ; par le nombre adequat de pays */

/* 
%let pays1=FR ; %let pays2=AT ; %let pays3=BE ; %let pays4=BG; %let pays5=CZ ; %let pays6=DK ; %let pays7=DE ; %let pays8=EE; %let pays9=IE; %let pays10=EL; %let pays11=ES;  
%let pays12=IT; %let pays13=LV; %let pays14=LT; %let pays15=LU; %let pays16=HU; %let pays17=NL; %let pays18=PL; %let pays19=PT; %let pays20=RO; %let pays21=SI; %let pays22=SK; %let pays23=FI; %let pays24=SE; %let pays25=UK; 
*/

/* remplacer <dateachanger> par la vraie date */

libname in2 "C:\travail\etudes\projetpib\donnees\fichiersfinaux\<dateachanger>\dico2";

/* remplacer <dateachanger> par la vraie date */

libname in3 "C:\travail\etudes\projetpib\donnees\fichiersfinaux\<dateachanger>\dico3";

/* remplacer <MoisAnnee> par le mois et l'annee */

proc printto log="C:\travail\etudes\projetpib\docs\p3_<dateachanger>_v3.log" new;
  
%macro lec;
  
/*options SOURCE SOURCE2 MACROGEN SYMBOLGEN MLOGIC MPRINT;*/
 
/* 1ere partie */ 

%let pays1=FR ; %let pays2=AT ; %let pays3=BE ; %let pays4=BG; %let pays5=CZ ; %let pays6=DK ; %let pays7=DE ; %let pays8=EE; %let pays9=IE; %let pays10=EL; %let pays11=ES; %let pays12=HR; %let pays13=IT; %let pays14=CY; 
%let pays15=LV; %let pays16=LT; %let pays17=LU; %let pays18=HU; %let pays19=MT; %let pays20=NL; %let pays21=PL; %let pays22=PT; %let pays23=RO; %let pays24=SI; %let pays25=SK; %let pays26=FI; %let pays27=SE; %let pays28=UK; 

/* variables pour 28 pays */

  
  %do l=1 %to 28 ;
  
  data dico&&pays&l ; set in2.dico&&pays&l ;
  res=find(intitule,",&&pays&l")  ;
  if res gt 0 ;
  run ;
  
  data dico&&pays&l ; set dico&&pays&l ;
  call symput("nvar&&pays&l",trim(left(_n_))) ;
  run ;
  
  
  data dico&&pays&l ; set dico&&pays&l ;
  %do u=1 %to &&&&nvar&&pays&l ;
  if _n_ eq &u then call symput("var&&pays&l.._&u",trim(left(nomvar))) ;
  %end ;
  run ;
  
/* 2eme partie */ 

/* on transforme le format texte des dates en vraies dates */
  
data a&&pays&l.._1;
set in2.a&&pays&l;
nouv_date=mdy(substr(date,6,2),01,substr(date,1,4));
format nouv_date monyy5.;
run;

/* on supprime la derniere ligne , avec la date maximum */

%do nume=2 %to 6;

data a&&pays&l.._&nume;
set a&&pays&l.._%eval(&nume-1);
if month(nouv_date) lt 12 then nouv_date=mdy(month(nouv_date)+1,01,year(nouv_date));
else nouv_date=mdy(01,01,year(nouv_date)+1);
run ;
%end;

/* On tri les tableaux intermediaires via la date, obligatoire */

%do nume=1 %to 6;
proc sort data = a&&pays&l.._&nume;
by nouv_date;
run;
%end;


 /* on supprime l'ancienne table pour pouvoir faire une fusion avec le nom de l'ancienne table , sans ses donnees */

 /*proc delete data=a&&pays&l;*/
  
  data a&&pays&l;
  merge %do j=1 %to 6 ; a&&pays&l.._&j(rename=(%do i=1 %to &&&&nvar&&pays&l  ; &&&&var&&pays&l.._&i=&&&&var&&pays&l.._&i.._t%eval(&j-1) %end ; )) %end ; ;
  by nouv_date;
  run;
  
 /* on supprime les tables intermediaires */
  
%do i=1 %to 6;
proc delete data=a&&pays&l.._&i;
run;
%end;

/* sauvegarde des fichiers */

data in3.a&&pays&l; set a&&pays&l; run;
data in3.dico&&pays&l ; set dico&&pays&l;run;

%end;

  
 %mend ;

 %lec;
/* utilise pour test

proc print data=aat;
var nouv_date var1_t0 var1_t1 var1_t2 var1_t3 var1_t4 var1_t5 var31_t0 var31_t1 var31_t2 var31_t3 var31_t4 var31_t5 var60_t0 var60_t1 var60_t2 var60_t3 var60_t4 var60_t5;
run;

 proc printto;
 run;


*/



 
