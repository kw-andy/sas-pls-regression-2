
/* on met today pour avoir la date sous forme yyyymmdd */

%let today=%sysfunc(today(),yymmddn8.);

libname in3 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\dico3"  ;

libname in4 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\dico4"  ;

proc printto log="C:\travail\etudes\projetpib\docs\p4_&today._v2.log" new;
  
%macro lapls;
  
/*options SOURCE SOURCE2 MACROGEN SYMBOLGEN MLOGIC MPRINT;*/
 
/* 1ere partie */ 

%let pays1=FR ; %let pays2=DE ; %let pays3=UK; %let pays4=IT;%let pays5=ES; %let pays6=DK ;%let pays7=AT ; %let pays8=EE; %let pays9=IE; %let pays10=EL; %let pays11=CZ ; %let pays12=HR;  %let pays13=BG; %let pays14=CY; 
%let pays15=LV; %let pays16=LT; %let pays17=LU; %let pays18=HU; %let pays19=MT; %let pays20=NL; %let pays21=PL; %let pays22=PT; %let pays23=RO; %let pays24=SI; %let pays25=SK; %let pays26=FI; %let pays27=SE;  %let pays28=BE ; 

/* variables pour 28 pays */

/* test: necessite de changer le l pour le(s) pays concerne (s) */
%do l=1 %to 5 ;

/* 1) On cree la table de resultat pour le pays en question */

data a&&pays&l.._res ; 
run ; 

/* 2) On prend les tables de dictionnaire des pays et on cherche les intitules 
   pour chaque pays , pour chaque dictionnaire */
  
data dico&&pays&l ; set in3.dico&&pays&l ;
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
if _n_ eq &i then call symput("var&&pays&l.._&i",trim(left(nomvar))) ;
%end ;
run ;

options nonotes ;

/* 5) Creation de deux boucles la , allant de 0 a 5 et lb, allant de 0 a 5*/

%do la=0 %to 5 ;/* 0*/
 
%do lb=0 %to 5;/* 0*/

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

/* 11) on fait un sommaire avec ? Pourquoi il n'y a pas de dataset ?*/

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

proc sort data=a ; by annee qtr ; 
run ; 

/*14) 
si &la est egale a zero , on met la variable qui finit par i_pib_t0 en logarithme 

si &la superieur ou egal a 1 , on donne la formule ci-dessous à la variable qui finit par i_pib_t0 
-> exp(&la/5*log(&&&&var&&pays&l.._&i_pib.._t0))/(&la/5)

On applique le logarithme au reste des variables dans le cas ou &lb est egale a 0.
On applique la formule ci-dessous au reste des variables dans le cas ou &lb est superieur ou egal a 1.
exp(&la/5*log(&&&&var&&pays&l.._&i_pib.._t0))/(&la/5)
Question : pourquoi avoir mis &la et &lb?
*/

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

/*
15) je comprends pas a quoi sert f ci-dessous.
*/

%do f=1 %to 10;/*  1*/

/*
16) 

La PLS tourne deux dois, une fois avec i1_ et une autre fois, avec  i2_
avec les outputs respectifs pour chacun.

*/

%do u=1 %to 5; /* 4*/
%put &l &la &lb &u &f ;
 
proc pls data=a noprint nfac=&f ;
model l&&&&var&&pays&l.._&i_pib.._t0 =
%do j=&u %to 5 ;%do i=1 %to &&&&nvar&&pays&l ; 
%if (&i ne &i_pib or &j ne 0) %then %do ; 
%if  &&&&i1_&i._&j eq 1 %then %do  ; 
lvarnum_&i._&j %end ; %end; %end ; %end ;  ;
output out=a1_1_res&u predicted=prev_pib ; 
  run;

proc pls data=a noprint nfac=&f ;
model l&&&&var&&pays&l.._&i_pib.._t0 =
%do j=1 %to 5 ;%do i=1 %to &&&&&&nvar&&pays&l ; 
%if (&i ne &i_pib or &j ne 0) %then %do ; 
%if &&&&i2_&i._&j eq 1 %then %do  ; 
lvarnum_&i._&j %end ; %end; %end ; %end ;  ;
output out=a2_1_res&u predicted=prev_pib ; 
  run;

/* 
17) 
le resultat des 2 pls 
 dans une table unique avec mise en exponentielle pour prev_pib dans 
le cas ou la egal a 0 et si la est egale ou plus grand que 1 et si 
prev_pib strictement superieur a zero , on applique prev_pib 
la formule suivante :
exp(log((&la/5)*prev_pib)/(&la/5))
*/
data a_res&u ; set a1_1_res&u (in=e1) a2_1_res&u (in=e2) ;
if e1 then nvar=1 ; else nvar=2 ;
%if &la eq 0 %then %do ; prev_pib=exp(prev_pib) ; %end ; 
%if &la ge 1 %then %do ; 
if prev_pib gt 0 then prev_pib=exp(log((&la/5)*prev_pib)/(&la/5)) ; else delete ; 
%end ; 
run ; 


/* 18)
dans ces deux conditions
-(annee lt ann_prev)
-(annee eq ann_prev and qtr lt qtr_prev)
on fait les traitements suivants sur la table a_res&u
prev_pib=act_pib ; 
delta_pib=(act_pib-lag(act_pib))/lag(act_pib) ; 
edelta_pib=(prev_pib-lag(prev_pib))/lag(prev_pib) ; 

 */

data a_res&u ; set a_res&u ; 
if (annee lt ann_prev) or (annee eq ann_prev and qtr lt qtr_prev) then prev_pib=act_pib ; 
delta_pib=(act_pib-lag(act_pib))/lag(act_pib) ; 
edelta_pib=(prev_pib-lag(prev_pib))/lag(prev_pib) ; 
run ; 

/*19) Je ne comprends pas cette partie*/
data a_res&u ; set a_res&u ; 
if (annee gt ann_prev) or (annee eq ann_prev and qtr ge qtr_prev) ;
run ; 


/*20) On rajoute les modeles : A quoi sert hprev?*/
data a_res&u ; set a_res&u ; 
format model $50. ; 
if nvar eq 1 then model="model1_&u._&la._&lb._&f      " ;
if nvar eq 2 then model="model2_&u._&la._&lb._&f      " ;  
hprev=_n_ ; 
if hprev le 4 ; 
run ; 

/*21) On aggrege les tables a&&pays&l.._res et a_res&u en une table a&&pays&l.._res  */

data a&&pays&l.._res ; set a&&pays&l.._res a_res&u  ; 
run;

%end ; 
%end ; 
%end ; 
%end ; 

/*22) Si hprev est a valeur manquante , on retourne la valeur absolue de la difference entre
delta_pib et edelta_pib */

data a&&pays&l.._res ; set a&&pays&l.._res ;
if hprev ne . ; 
delta=abs(delta_pib-edelta_pib) ; 
run ; 


/*23) on fait un tri par annee , trimestre , hprev et delta*/
proc sort data=a&&pays&l.._res  out=a&&pays&l.._res ; 
by annee qtr hprev delta ; run ; 

/*24) impression sur les variables : var annee qtr model hprev delta delta_pib edelta_pib prev_pib act_pib*/
proc print data=a&&pays&l.._res  ;
var annee qtr model hprev delta delta_pib edelta_pib prev_pib act_pib ; 
run ; 

data in4.a&&pays&l.._res ; set a&&pays&l.._res ;

%end;

%mend ;

%lapls;


