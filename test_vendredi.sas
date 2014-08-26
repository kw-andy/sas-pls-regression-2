
/* on met today pour avoir la date sous forme yyyymmdd */

/*%let today=%sysfunc(today(),yymmddn8.);*/

libname in3 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\dico3"  ;

libname in4 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\dico4"  ;

/*proc printto log="C:\travail\etudes\projetpib\docs\p4_20140731_v2.log" new;*/
  
%macro lapls;
  
/*options SOURCE SOURCE2 MACROGEN SYMBOLGEN MLOGIC MPRINT;*/
 
/* 1ere partie */ 

%let pays1=FR ; %let pays2=DE ; %let pays3=UK; %let pays4=IT;%let pays5=ES; %let pays6=DK ;%let pays7=AT ; %let pays8=EE; %let pays9=IE; %let pays10=EL; %let pays11=CZ ; %let pays12=HR;  %let pays13=BG; %let pays14=CY; 
%let pays15=LV; %let pays16=LT; %let pays17=LU; %let pays18=HU; %let pays19=MT; %let pays20=NL; %let pays21=PL; %let pays22=PT; %let pays23=RO; %let pays24=SI; %let pays25=SK; %let pays26=FI; %let pays27=SE;  %let pays28=BE ; 

/* variables pour 28 pays */

/* test: necessite de changer le l pour le(s) pays concerne (s) */
%do l=1 %to 1 ;

/* 1) On cree la table de resultat pour le pays en question */

data a&&pays&l.._res ; 
run ; 

/* 2) On prend les tables de dictionnaire des pays et on cherche les intitules 
   pour chaque pays , pour chaque dictionnaire */
/*rajout 11/08/14 - ok */
data dico&&pays&l ; set in3.dico&&pays&l ;
length dispo 3.;
if ajoutdate=777 then dern_date_dispo = intnx('weekday',intnx('month',date(),-1,'E'),-1); 
else if periode = "q" then dern_date_dispo=date()-ajoutdate;
else if periode = "m" and ajoutdate ne 777 then dern_date_dispo=date()-ajoutdate;
dispo=date()gt dern_date_dispo;
run;

  
data dico&&pays&l ; set dico&&pays&l ;
res=find(intitule,",&&pays&l")  ;
if res gt 0 ;
run ;

 /* 3) Pour chaque dictionnaire , on crée les variables pour chaque pays  */

data dico&&pays&l ; set dico&&pays&l ;
call symput("nvar&&pays&l",trim(left(_n_))) ;
run; 

/* 4) dans le dictionnaire de donnee du pays , si l'intitule est "SWDA,MIO_EUR_CLV2005,B1GM,&&pays&l avec &&pays&l pour les 2 lettres du pays
on cree une variable qui se nomme i_pib.
Pour toutes les variables issues du dictionnaire de donnees, on cree une variable qui commence par les lettres var avec  
l'extension du pays */

data dico&&pays&l ; set dico&&pays&l ;
if intitule eq "SWDA,MIO_EUR_CLV2005,B1GM,&&pays&l" then call symput("i_pib",trim(left(_n_))) ;
%do i=1 %to &&&&nvar&&pays&l ;
if _n_ eq &i then call symputx("var&&pays&l.._&i",left(nomvar)) ;
/*call symputx("dispo"||nomvar,dispo) ; rajout 11/08/14*/
%end ;
run ;

/*
ii = left(put(i,2.)); 
call symput('n',ii); 
call symput('dsn'||ii,left(dsn)); 

ii = left(put(i,2.)); 
call symput('n',ii); 
call symput('dsn'||ii,left(dsn)); 

data a;
set test end=eof;
length cat $100.;
retain cat;
if AddToStringYN = "Y" then do;
   cat=trim(left(cat))||trim(left(value));
end;
if eof then do;
   call symput("VAR",cat);
   output;
end;
run;

%put VAR=&VAR;

*/

options nonotes ;

/* 5) Creation de deux boucles la , allant de 0 a 5 et lb, allant de 0 a 5
la et lb separes permettent d'avoir une non uniformite au niveau des modeles car "la" va avec Y et "lb" avec le reste des X
*/

;/*%do la=0 %to 5 ------ 0*/
 
/*%do lb=0 %to 5; ------0*/

/* 6) creation de la table date en utilisant la table a&&pays&l
si l'annee de la nouv_date est 2014 et le mois pour nouv_date est 7, on garde nouv_date  */
data date ; set in3.a&&pays&l ; 
if year(nouv_date) eq 2014 and month(nouv_date) eq 7 ; 
keep nouv_date ; 
run ; 


/* 7) s'il existe une observation dans a, on change le nom de la variable nouv_date en date_prev dans la table 
date *
on cree la variable annee a partir de nouv_date
on cree la variable trimestre a partir de nouv_date
on cree la variable ann_prev a partir de l'annee de date_prev
on cree la variable qtr_prev a partir du trimestre de date_prev
Ensuite pour toutes les variables qui existent , on les renomme en varnum_&i._&j
On met en act_pib toutes les variables qui ont l'extension i_pib.._t0
Si la variable nouv_date est superieur a date_prev , on met les variables avec l'extension pib.._t0
en valeurs manquantes.
*/

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
if 
varnum_&i._&j=&&&&var&&pays&l.._&i.._t&j; %end ; %end; 
act_pib= &&&&var&&pays&l.._&i_pib.._t0 ; 
if nouv_date ge date_prev then &&&&var&&pays&l.._&i_pib.._t0=. ; 
run ; 


/* 
8) on fait un proc summary pour toutes les variables qui existent dans la table a 
ou on prend le minimum 
*/

proc summary data=a ; ;
var %do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; varnum_&i._&j %end ; %end ;  ; 
output out=min min=%do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; min_varnum_&i._&j %end ; %end ; ; 
run;

/* 
9) Je ne comprends pas cette partie
*/

data a ; if _n_ eq 1 then set min ; 
set a   ; 
run ; 

/* 
10) boucle avec toutes les variables : si les variables qui commencent avec 
min_varnum sont négatives, on soustrait la variable qui commence par varnum_ avec 
la variable qui commence par min_varnum et on la met dans la variable qui commence par 
varnum_.
Si la variable qui commence par varnum_ est égale à zéro , on met la variable qui commence par varnum_ à 0,0001
*/

data a ; set a ; 
%do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; 
if min_varnum_&i._&j lt 0 then
varnum_&i._&j=varnum_&i._&j-min_varnum_&i._&j ; 
if varnum_&i._&j eq 0 then varnum_&i._&j=0.0001 ; 
%end ; %end; 
run  ; 

/* 11) si pas de nom de tables, on prend la derniere table : truc de sas */

proc summary nway ; id qtr_prev ann_prev ; 
class annee qtr ; 
var act_pib &&&&var&&pays&l.._&i_pib.._t0 
%do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; 
%if &i ne &i_pib or &j ne 0 %then %do  ; 
varnum_&i._&j %end ; %end; %end ; ;
output out=a mean= ; 
run ; 

/* 12) on fait un tri pour les annees et les trimestres, de l'annee et du trimestre le plus recente a l'annee et le trimestre le plus lointain*/

proc sort data=a  ; by descending annee descending qtr ; 
run ; 

/* 13) s'il y'a une premiere observation, 
on prend toutes les variables. si &i est different de i_pib ou j est different de 0,
on met "ind" egale a la variable qui commence par varnum et on cree les variables qui commencent par
"i1".

s'il y'a une deuxieme observation, 
on prend toutes les variables. si &i est different de i_pib ou j est different de 0,
on met "ind" egale a la variable qui commence par varnum et on cree les variables qui commencent par
"i2".

ind=varnum_&i._&j ne . 
-> cela permet de mettre 1 ou 0 -> 0 si missing values et 1 si la valeur existe
   
*/

data a ; set a ; 
if _n_ eq 1 then do ; 
%do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; 
%if &i ne &i_pib or &j ne 0 %then %do  ; 
ind=varnum_&i._&j ne . ;
call symput("i1_&i._&j",trim(left(ind))) ; 
%end ; %end; %end ; ;
end ; 
if _n_ eq 2 then do ; 
%do j=0 %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; 
%if &i ne &i_pib or &j ne 0 %then %do  ; 
ind=varnum_&i._&j ne . ;
call symput("i2_&i._&j",trim(left(ind))) ; 
%end ; %end; %end ; ;
end ; 
run ; 


/*13) on fait un tri de a*/

%end;

%mend ;

%lapls;
/*
proc printto;
run;


data dicofr ; set in3.dicofr ;
length dispo 3.;
if ajoutdate=777 then dern_date_dispo = intnx('weekday',intnx('month',date(),-1,'E'),-1); 
else if periode = "q" then dern_date_dispo=date()-ajoutdate;
else if periode = "m" and ajoutdate ne 777 then dern_date_dispo=date()-ajoutdate;
if date()> dern_date_dispo then dispo=0; else dispo=1;
run;

data toto;
input toto 1.;
cards;
.
run;

data titi;
set dicofr;
taty= trim(left(nomvar));
run;
*/
