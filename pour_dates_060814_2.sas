libname in1 "C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\dico1";

/* options macrogen symbolgen ; */

/*proc printto log="C:\travail\etudes\projetpib\docs\p1_20140731_v5.log" new;*/

/* partie 1 : mise en place de la correspondance des noms des fichiers et des noms des series telechargeee */

PROC IMPORT OUT= corresp1
            DATAFILE= "C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\corresp20140731.txt"  
            DBMS=DLM REPLACE;
     DELIMITER=' ';
	guessingrows=1000 ; 
     GETNAMES=no;
     DATAROW=1; 
RUN;

/* Nllecorresp<dateachanger>_v1.txt = fichier sans les v1, v2 etc ... */

PROC IMPORT OUT= corresp2
            DATAFILE= "C:\travail\etudes\projetpib\donnees\fichiersfinaux\20140731\nllecorresp20140731.txt"  
            DBMS=DLM REPLACE;
     DELIMITER=' ';
	guessingrows=1000 ; 
     GETNAMES=no;
     DATAROW=1; 
RUN;

data correspondance;
format var1 $25. var2 $25. periode $1. date_publi1 $25. ajoutdate 3. dern_date_dispo ddmmyy10.;
stop;
run;


proc sql;
insert into correspondance (var1,var2)
select a.var1, b.var2 
   from corresp1 a 
   inner join corresp2 b on a.var2 = b.var1;
quit;


 
%macro corresp;

proc sql;
select count(*) into :nbfic from correspondance;
quit;

proc sql;
select var1 into :nomficq separated by ' ' from correspondance where periode
="q";
quit;

proc sql;
select ajoutedate into :ajoutdateq separated by ' ' from correspondance where periode
="q";
quit;

proc sql;
select var1 into :nomficmne777 separated by ' ' from correspondance where periode
="m" and ajoutdate ne 777;
quit;

proc sql;
select ajoutedate into :ajoutdatemne777 separated by ' ' from correspondance where periode
="m" and ajoutdate ne 777;
quit;

proc sql;
select var1 into :nomficm separated by ' ' from correspondance where periode
="m" and ajoutdate eq 777;
quit;

proc sql;
select ajoutedate into :ajoutdate separated by ' ' from correspondance where periode
="m" and ajoutdate ne 777;
quit;

%put nbfic: &nbfic ;
%put nomficq: &nomficq;
%put ajoutedateq: &ajoutedateq;
%put nomficmne777: &nomficmne777;
%put ajoutdatemne777: &ajoutdatemne777;
%put nomficm: &nomficm;
%put ajoutedate: &ajoutedate;

data correspondance;
set correspondance;
%do i=1 to &nbfic;
if periode="q" and var1=&nomficq then do;
dern_date_trim_3=intnx('quarter',intnx('month',date(),0,'E'),-4,'E');
dern_date_publi_3=intnx('day',intnx('quarter',intnx('month',date(),0,'E'),-4,'E'),20);
dern_date_trim_2=intnx('quarter',intnx('month',date(),0,'E'),-3,'E');
dern_date_publi_2 =intnx('day',intnx('quarter',intnx('month',date(),0,'E'),-3,'E'),20);
dern_date_trim_1=intnx('quarter',intnx('month',date(),0,'E'),-2,'E');
dern_date_publi_1=intnx('day',intnx('quarter',intnx('month',date(),0,'E'),-2,'E'),20);
dern_date_trim_0=intnx('quarter',intnx('month',date(),0,'E'),-1,'E');
dern_date_publi_0=intnx('day',intnx('quarter',intnx('month',date(),0,'E'),-1,'E'),20);
format dern_date_publi_0 dern_date_trim_0 dern_date_publi_1 dern_date_trim_1 dern_date_publi_2 dern_date_trim_2 dern_date_publi_3 dern_date_trim_3 dern_dispo ddmmyy10.; 
end;
else if periode="m" and ajoutdate ne 777 and var1=&nomficmne777 then do; 
   dern_date_mois_3=intnx('month',intnx('month',date(),0,'E'),-4,'E'); 
   dern_date_publi_3 =intnx('day',intnx('month',intnx('month',date(),0,'E'),-4,'E'),&ajoutdatemne777);
   dern_date_mois_2=intnx('month',intnx('month',date(),0,'E'),-3,'E'); 
   dern_date_publi_2 =intnx('day',intnx('month',intnx('month',date(),0,'E'),-3,'E'),&ajoutdatemne777);
   dern_date_mois_1=intnx('month',intnx('month',date(),0,'E'),-2,'E'); 
   dern_date_publi_1 =intnx('day',intnx('month',intnx('month',date(),0,'E'),-2,'E'),&ajoutdatemne777);
   dern_date_mois_0=intnx('month',intnx('month',date(),0,'E'),-1,'E'); 
   dern_date_publi_0 =intnx('day',intnx('month',intnx('month',date(),0,'E'),-1,'E'),&ajoutdatemne777);
   format dern_date_mois_3 dern_date_publi_3 dern_date_mois_2 dern_date_publi_2 dern_date_mois_1 dern_date_publi_1 dern_date_mois_0 dern_date_publi_0 dern_dispo ddmmyy10.; 
end;
else if periode="m" and ajoutdate eq 777 and var1=&nomficm then do; 
   dern_date_mois_3=intnx('month',intnx('weekday',intnx('month',date(),0,'E'),-1),-4); 
   dern_date_publi_3 =intnx('day',intnx('month',intnx('weekday',intnx('month',date(),0,'E'),-1),-4),&ajoutdate);
   dern_date_mois_2=intnx('month',intnx('weekday',intnx('month',date(),0,'E'),-1),-3); 
   dern_date_publi_2 =intnx('day',intnx('month',intnx('weekday',intnx('month',date(),0,'E'),-1),-3),&ajoutdate);
   dern_date_mois_1=intnx('month',intnx('weekday',intnx('month',date(),0,'E'),-1),-2); 
   dern_date_publi_1 =intnx('day',intnx('month',intnx('weekday',intnx('month',date(),0,'E'),-1),-2),&ajoutdate);
   dern_date_mois_0=intnx('month',intnx('weekday',intnx('month',date(),0,'E'),-1),-1); 
   dern_date_publi_0 =intnx('day',intnx('month',intnx('weekday',intnx('month',date(),0,'E'),-1),-1),&ajoutdate);
   format dern_date_mois_3 dern_date_publi_3 dern_date_mois_2 dern_date_publi_2 dern_date_mois_1 dern_date_publi_1 dern_date_mois_0 dern_date_publi_0 dern_dispo ddmmyy10.; 
end;

if periode="q" and var1=&nomficq and dern_date_publi_0 < date()  then ;
dern_dispo=dern_date_mois_0; 
else if periode="q" and var1=&nomficq and dern_date_publi_1 <  date() 
then dern_dispo=dern_date_mois_1; 
else if periode="q" and var1=&nomficq and dern_date_publi_2 <  date() 
then dern_dispo=dern_date_mois_2; 
else if var1="ei_eteu27_m.tsv" and dern_date_publi_3 <  date() then dern_dispo=dern_date_mois_3;

if var1="ei_bpfa_q.tsv" and dern_date_publi_0 < date() then dern_dispo=dern_date_trim_0; 
else if var1="ei_bpfa_q.tsv" and dern_date_publi_1 <  date() then dern_dispo=dern_date_trim_1; 
else if var1="ei_bpfa_q.tsv" and dern_date_publi_2 <  date() then dern_dispo=dern_date_trim_2; 
else if var1="ei_bpfa_q.tsv" and dern_date_publi_3 <  date() then dern_dispo=dern_date_trim_3;
else;


run;

%end;

%mend;

%corresp;

proc export data=correspondance outfile="C:\Users\Andy Kwok\Desktop\test.csv" 
dbms =csv replace;
delimiter="3B"x;
run;
