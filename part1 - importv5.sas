/* c'est un test*/
/*remplacer <dateachanger> par la vraie date*/

libname in1 "C:\travail\etudes\projetpib\donnees\fichiersfinaux\<dateachanger>\dico1";

/*options macrogen symbolgen ;*/

proc printto log="C:\travail\etudes\projetpib\docs\p1_<dateachanger>_v5.log" new;


PROC IMPORT OUT= corresp1
            DATAFILE= "C:\travail\etudes\projetpib\donnees\fichiersfinaux\<dateachanger>\corresp<dateachanger>.txt"  
            DBMS=DLM REPLACE;
     DELIMITER=' ';
	guessingrows=1000 ; 
     GETNAMES=no;
     DATAROW=1; 
RUN;

/* Nllecorresp20140704_v1.txt = fichier vidé des vx1 vx2 etc ...*/

PROC IMPORT OUT= corresp2
            DATAFILE= "C:\travail\etudes\projetpib\donnees\fichiersfinaux\<dateachanger>\nllecorresp<dateachanger>.txt"  
            DBMS=DLM REPLACE;
     DELIMITER=' ';
	guessingrows=1000 ; 
     GETNAMES=no;
     DATAROW=1; 
RUN;

data correspondance;
format var1 $25. var2 $25. periode $1. date_publi $25.;
stop;
run;


proc sql;
insert into correspondance (var1,var2)
select a.var1, b.var2 
   from corresp1 a 
   inner join corresp2 b on a.var2 = b.var1;
quit;
 
data correspondance;
set correspondance (rename=var2=nom_fic);
if var1="ei_bsco_m.tsv" then do; periode="m"; date_publi="av-der"; end;
if var1="ei_bsin_m_r2.tsv" then do; periode="m"; date_publi="av-der"; end;
if var1="ei_bsbu_m_r2.tsv" then do; periode="m"; date_publi="av-der"; end;
if var1="ei_bsrt_m_r2.tsv" then do; periode="m"; date_publi="av-der"; end;
if var1="ei_bssi_m_r2.tsv" then do; periode="m"; date_publi="av-der"; end;
if var1="ei_bsse_m_r2.tsv" then do; periode="m"; date_publi="av-der"; end;
if var1="ei_bsci_m_r2.tsv" then do; periode="m"; date_publi="av-der";end;
if var1="ei_bsfs_m.tsv" then do; periode="m"; date_publi="av-der";end;
if var1="ei_bpfa_q.tsv" then do; periode="q"; date_publi="q+56";end;
if var1="ei_cphi_m.tsv" then do; periode="m"; date_publi="http://bit.ly/1pL3Czw";end;
if var1="ei_eteu27_m.tsv" then do; periode="m"; date_publi="m+56";end;
if var1="ei_eteu28_m.tsv" then do; periode="m"; date_publi="m+56";end;
if var1="ei_etea16_m.tsv" then do; periode="m"; date_publi="m+56";end; 
if var1="ei_etea17_m.tsv" then do; periode="m"; date_publi="m+56";end; 
if var1="ei_isin_m.tsv" then do; periode="m"; date_publi="m+84";end; 
if var1="ei_isbu_m.tsv" then do; periode="m"; date_publi="m+126";end;
if var1="ei_isrt_m.tsv" then do; periode="m"; date_publi="m+84";end; 
if var1="ei_lmhu_m.tsv" then do; periode="m"; date_publi="m+44";end;
if var1="ei_lmhr_m.tsv" then do; periode="m"; date_publi="m+42";end;
if var1="ei_lmlc_q.tsv" then do; periode="q"; date_publi="q+98";end;
if var1="ei_lmjv_q_r2.tsv" then do; periode="q"; date_publi="N/A enco";end;
if var1="ei_mfir_m.tsv" then do; periode="m"; date_publi="m+14";end;
if var1="ei_mfrt_m.tsv" then do; periode="m"; date_publi="m+14";end;
if var1="ei_nagd_q_r2.tsv" then do; periode="q"; date_publi="q+157";end;
if var1="ei_nagt_q_r2.tsv" then do; periode="q"; date_publi="q+157";end;
if var1="ei_nasa_q.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="ei_nanf_q.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_gdp_k.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_fcs_c.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_fcs_k.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_fcs_p.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_exi_c.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_exi_k.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_exi_p.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_nace10_k.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_pi6_c.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_pi6_k.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_pi6_p.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_aux_lp.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_aux_ulc.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="namq_aux_gph.tsv" then do; periode="q"; date_publi="q+63";end;
if var1="irt_euryld_m.tsv" then do; periode="m"; date_publi="m+2";end;
if var1="irt_st_m.tsv" then do; periode="m"; date_publi="m+42";end;
if var1="prc_hicp_cann.tsv" then do; periode="m"; date_publi="http://bit.ly/1pL3Czw";end;
if var1="prc_hicp_midx96.tsv" then do; periode="m"; date_publi="http://bit.ly/1pL3Czw";end;
if var1="prc_hpi_q.tsv" then do; periode="q"; date_publi="q+126";end;
if var1="prc_ipc_g20.tsv" then do; periode="q"; date_publi="http://bit.ly/WQNWEt";end;
if var1="sts_inpr_m.tsv" then do; periode="m"; date_publi="m+84";end;
if var1="sts_intv_m.tsv" then do; periode="m";date_publi="m+84";end;
if var1="sts_intvd_m.tsv" then do; periode="m"; date_publi="m+84";end;
if var1="sts_intvnd_m.tsv" then do; periode="m"; date_publi="m+84";end;
if var1="sts_inpp_m.tsv" then do; periode="m"; date_publi="m+47";end;
if var1="sts_inlb_m.tsv" then do; periode="m"; date_publi="m+126";end;
if var1="sts_copr_m.tsv" then do; periode="m"; date_publi="m+47"; end;
if var1="sts_colb_m.tsv" then do; periode="m"; date_publi="m+126";end;
if var1="sts_cobp_m.tsv" then do; periode="m"; date_publi="m+126";end;
if var1="sts_trtu_m.tsv" then do; periode="m"; date_publi="m+84";end;
if var1="sts_trlb_m.tsv" then do; periode="m"; date_publi="m+84";end;
if var1="sts_setu_m.tsv" then do; periode="m"; date_publi="m+84";end;
if var1="sts_selb_m.tsv" then do; periode="m"; date_publi="m+84";end;
run;


/* changer le nom du repertoire */


%macro lec ;



%let nfic=88  ; 

%do i=1 %to &nfic  ;


data dico&i;
infile "C:\travail\etudes\projetpib\donnees\fichiersfinaux\<dateachanger>\fich&i..csv" dlm=';' lrecl=900000 obs=1; 
length intitule $50;
do i=1 to 25000 ; 
  input intitule $ @;
  output;
end;
run;

data dico&i ; set dico&i ; 
if _n_ eq 1 then delete ; 
drop i ; 
run ; 

data dico&i ; set dico&i ; 
call symput("nvar&i",trim(left(_n_))) ; 
run ;

data dico&i ; set dico&i ;
length nom_fic $ 10;
nom_fic="fich&i..csv"; 
run ;


PROC IMPORT OUT= fic&i 
            DATAFILE= "C:\travail\etudes\projetpib\donnees\fichiersfinaux\<dateachanger>\fich&i..csv"  
            DBMS=DLM REPLACE;
     DELIMITER='3B'x;
	guessingrows=1000 ; 
     GETNAMES=no;
     DATAROW=2; 
RUN;

proc sort ; by var1 ; run ; 

%if &i eq 1 %then %do ; 

data a ; set fic&i (rename=(var1=date)) ; 
%do l=1 %to &&nvar&i ;
rename var%eval(&l+1)=var%eval(&l %do k=1 %to %eval(&i-1) ; +&&nvar&k %end ;);
%end ; 
run ; 

%end ; 

%if &i ge 2 %then %do ;

data fic&i ; set fic&i ; 
rename var1=date ; 
%do l=1 %to &&nvar&i ;
rename var%eval(&l+1)=var%eval(&l %do k=1 %to %eval(&i-1) ; +&&nvar&k %end ;);
%end ;

data a ; merge a fic&i  ; 
by date ; 
run ; 

%end ; 

data in1.fic&i ; set fic&i ; 
run ; 

proc datasets noprint ; delete fic&i ; run ; 

%end ; 



/*data a ; set a ; 
%do i=1 %to &nfic ; 
%do l=1 %to &&nvar&i ; 
%let j=%eval(&i-1) ; 
rename var&i._&l=var%eval(&l %do k=1 %to %eval(&i-1) ; +&&nvar&k %end ;);  
%end ; 
%end ; 
run ; */



/*proc print ; run ; */

data dico ; set %do i=1 %to &nfic ; dico&i %end ; ; 
call symput('nvar',trim(left(_n_))) ; 
run ; 

data dico ; set dico ; 
%do l=1 %to &nvar ; 
if _n_ eq &l then nomvar="var&l      " ; 
%end ; 
run ;

data in1.dico ; set dico ; run ; 

proc print data=dico (obs=10) ; 
run ;  
/* cette partie est diffÃƒÆ’Ã‚Â©rente de l'import */

/* %let nom_variable=1 -puis-  %let pays&nom_variable1=FR */

%let pays1=FR ; %let pays2=AT ; %let pays3=BE ; %let pays4=BG; %let pays5=CZ ; %let pays6=DK ; %let pays7=DE ; %let pays8=EE; %let pays9=IE; %let pays10=EL; %let pays11=ES; %let pays12=HR; %let pays13=IT; %let pays14=CY; 
%let pays15=LV; %let pays16=LT; %let pays17=LU; %let pays18=HU; %let pays19=MT; %let pays20=NL; %let pays21=PL; %let pays22=PT; %let pays23=RO; %let pays24=SI; %let pays25=SK; %let pays26=FI; %let pays27=SE; %let pays28=UK; 
/* 28 variables pour 28 pays*/
%do l=1 %to 28 ;

data dico&&pays&l ; set dico ; 
res=find(intitule,",&&pays&l")  ; 
if res gt 0 ; 
run ; 

data dico&&pays&l ; set dico&&pays&l ; 
call symput("nvar&&pays&l",trim(left(_n_))) ;
run ;

/*pourquoi &&&&nvar ?*/
data dico&&pays&l ; set dico&&pays&l ; 
%do u=1 %to &&&&nvar&&pays&l ; 
if _n_ eq &u then call symput("var&&pays&l.._&u",trim(left(nomvar))) ;
%end ; 
run ; 

proc print data=dico&&pays&l (obs=10); 
run ; 

data a&&pays&l ; set a ; 
keep date %do u=1 %to &&&&nvar&&pays&l ; 
&&&&var&&pays&l.._&u  %end ;   ; 
run ; 

proc print data=a&&pays&l (obs=3) ; 
run ; 

data dico&&pays&l ; set dico&&pays&l ; 
length periode $1. date_publi $25.;
run;

proc sql;
     update dico&&pays&l as h1
     set periode=(select periode from correspondance as h2 where h1.nom_fic=h2.nom_fic)
     where nom_fic in (select nom_fic from correspondance);
	 update dico&&pays&l as h1
     set date_publi=(select date_publi from correspondance as h2 where h1.nom_fic=h2.nom_fic)
     where nom_fic in (select nom_fic from correspondance);
quit;


%end ; 



%mend ; 

%lec ; 

