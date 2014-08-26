/*proc printto;
run;*/
/* on met today pour avoir la date sous forme yyyymmdd */

/*%let today=%sysfunc(today(),yymmddn8.);*/

libname in3 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\dico3"  ;

libname in4 
"C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\dico4"  ;

proc printto log="C:\travail\etudes\projetpib\docs\p4_20140731_vendredi.log" new;
  
%macro lapls;
  
options SOURCE SOURCE2 MACROGEN SYMBOLGEN MLOGIC MPRINT;
 
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

proc sql;
create table toto (col1 varchar(8));
insert into toto (col1) values ("123az");
update toto set col1="nvar&&pays&l";
quit;


/*13) on fait un tri de a*/

    data dico&&pays&l ; set dico&&pays&l ;
    if intitule eq "SWDA,MIO_EUR_CLV2005,B1GM,&&pays&l" then call symput("i_pib",trim(left(_n_))) ;
    %do i=1 %to &&&&nvar&&pays&l ;
    if _n_ eq &i and dispo eq 1 then call symput("var&&pays&l.._&i",trim(left(nomvar))) ; /*3) on a rajoute */
    %end ;
    run ;
    
    options nonotes ;
    
    
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
    format unvarnum_&&i._&j 10.3 zerovarnum_&&i._&j 10.3; 
    varnum_&i._&j=&&&&uvar&&pays&l.._&i._t&j;  /*unvarnum_&i._&j=&&&&uvar&&pays&l.._&i._t&j; -> ca coince ici*/
    zerovarnum_&&i._&j=&&&&zvar&&pays&l.._&i._t&j;;%end ; %end; 
    act_pib= &&&&zvar&&pays&l.._&i_pib.._t0 ; 
    if nouv_date ge date_prev then &&&&var&&pays&l.._&i_pib.._t0=. ; 
    run ; 
    
    proc sql;
	create table varnum_dispo (nomcol1 varchar(50), dispo varchar(3));
	insert into varnum_dispo (nomcol1) select name from dictionary.columns where name like "unvarnum%";
    update varnum_dispo set dispo="oui" 
    quit;

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
