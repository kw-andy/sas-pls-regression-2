%let today=%sysfunc(today(),yymmddn8.);

libname in1 "C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\dico1";

/* options macrogen symbolgen ; */

/* partie 1 : mise en place de la correspondance des noms des fichiers et des noms des series telechargeee */

PROC IMPORT OUT= corresp1
            DATAFILE= "C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\corresp&today..txt"  
            DBMS=DLM REPLACE;
     DELIMITER=' ';
	guessingrows=1000 ; 
     GETNAMES=no;
     DATAROW=1; 
RUN;

/* Nllecorresp<dateachanger>_v1.txt = fichier sans les v1, v2 etc ... */

PROC IMPORT OUT= corresp2
            DATAFILE= "C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\nllecorresp&today..txt"  
            DBMS=DLM REPLACE;
     DELIMITER=' ';
	guessingrows=1000 ; 
     GETNAMES=no;
     DATAROW=1; 
RUN;

data correspondance;
format var1 $25. var2 $25. periode $7. date_publi ddmmyy10. ajoutdate 3. dern_date_dispo ddmmyy10. label_eu_oc $4.;
stop;
run;


proc sql;
insert into correspondance (var1,var2)
select a.var1, b.var2 
   from corresp1 a 
   inner join corresp2 b on a.var2 = b.var1;
quit;
 

data calendeuro;
infile "C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\calend_euro.csv"  ;
input date ddmmyy10.;
format date ddmmyy10.;
run;

data calendocde;
infile "C:\travail\etudes\projetpib\donnees\fichiersfinaux\&today.\calend_ocde.csv"  ;
input date ddmmyy10.;
format date ddmmyy10.;
run;
 
data correspondance;
set correspondance (rename=var2=nom_fic);
if var1="ei_bsco_m.tsv" then do; periode="month"; ajoutdate=777; end;
if var1="ei_bsin_m_r2.tsv" then do; periode="month"; ajoutdate=777; end;
if var1="ei_bsbu_m_r2.tsv" then do; periode="month"; ajoutdate=777; end;
if var1="ei_bsrt_m_r2.tsv" then do; periode="month"; ajoutdate=777; end;
if var1="ei_bssi_m_r2.tsv" then do; periode="month"; ajoutdate=777; end;
if var1="ei_bsse_m_r2.tsv" then do; periode="month"; ajoutdate=777; end;
if var1="ei_bsci_m_r2.tsv" then do; periode="month"; ajoutdate=777;end;
if var1="ei_bsfs_m.tsv" then do; periode="month"; ajoutdate=777;end;
if var1="ei_bpfa_q.tsv" then do; periode="quarter"; ajoutdate=56;end;
if var1="ei_cphi_m.tsv" then label_eu_oc="euro" ;
if var1="ei_eteu27_m.tsv" then do; periode="month"; ajoutdate=56;end;
if var1="ei_eteu28_m.tsv" then do; periode="month"; ajoutdate=56;end;
if var1="ei_etea16_m.tsv" then do; periode="month"; ajoutdate=56;end; 
if var1="ei_etea17_m.tsv" then do; periode="month"; ajoutdate=56;end; 
if var1="ei_isin_m.tsv" then do; periode="month"; ajoutdate=84;end; 
if var1="ei_isbu_m.tsv" then do; periode="month"; ajoutdate=126;end;
if var1="ei_isrt_m.tsv" then do; periode="month"; ajoutdate=84;end; 
if var1="ei_lmhu_m.tsv" then do; periode="month"; ajoutdate=44;end;
if var1="ei_lmhr_m.tsv" then do; periode="month"; ajoutdate=42;end;
if var1="ei_lmlc_q.tsv" then do; periode="quarter"; ajoutdate=98;end;
if var1="ei_lmjv_q_r2.tsv" then periode="month"; 
if var1="ei_mfir_m.tsv" then do; periode="month"; ajoutdate=14;end;
if var1="ei_mfrt_m.tsv" then do; periode="month"; ajoutdate=14;end;
if var1="ei_nagd_q_r2.tsv" then do; periode="quarter"; ajoutdate=157;end;
if var1="ei_nagt_q_r2.tsv" then do; periode="quarter"; ajoutdate=157;end;
if var1="ei_nasa_q.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="ei_nanf_q.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_gdp_k.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_fcs_c.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_fcs_k.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_fcs_p.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_exi_c.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_exi_k.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_exi_p.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_nace10_k.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_pi6_c.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_pi6_k.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_pi6_p.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_aux_lp.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_aux_ulc.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="namq_aux_gph.tsv" then do; periode="quarter"; ajoutdate=63;end;
if var1="irt_euryld_m.tsv" then do; periode="month"; ajoutdate=2;end;
if var1="irt_st_m.tsv" then do; periode="month"; ajoutdate=42;end;
if var1="prc_hicp_cann.tsv" then label_eu_oc="euro";
if var1="prc_hicp_midx96.tsv" then label_eu_oc="euro";
if var1="prc_hpi_q.tsv" then do; periode="quarter"; ajoutdate=126;end;
if var1="prc_ipc_g20.tsv" then label_eu_oc="ocde";
if var1="sts_inpr_m.tsv" then do; periode="month"; ajoutdate=84;end;
if var1="sts_intv_m.tsv" then do; periode="month";ajoutdate=84;end;
if var1="sts_intvd_m.tsv" then do; periode="month"; ajoutdate=84;end;
if var1="sts_intvnd_m.tsv" then do; periode="month"; ajoutdate=84;end;
if var1="sts_inpp_m.tsv" then do; periode="month"; ajoutdate=47;end;
if var1="sts_inlb_m.tsv" then do; periode="month"; ajoutdate=126;end;
if var1="sts_copr_m.tsv" then do; periode="month"; ajoutdate=47; end;
if var1="sts_colb_m.tsv" then do; periode="month"; ajoutdate=126;end;
if var1="sts_cobp_m.tsv" then do; periode="month"; ajoutdate=126;end;
if var1="sts_trtu_m.tsv" then do; periode="month"; ajoutdate=84;end;
if var1="sts_trlb_m.tsv" then do; periode="month"; ajoutdate=84;end;
if var1="sts_setu_m.tsv" then do; periode="month"; ajoutdate=84;end;
if var1="sts_selb_m.tsv" then do; periode="month"; ajoutdate=84;end;
run;
