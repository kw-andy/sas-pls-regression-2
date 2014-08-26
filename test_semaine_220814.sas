data have;
ladate=input("10/02/2014",ddmmyy10.);
format ladate ddmmyy10.;
run;

data want;
set have;
lannee=year(ladate);
lemois=month(ladate);
run;

data  toto;
  input var1 $18. periode $7. adddate;
  cards;
ei_isbu_m.csv     month   56 
namq_nace10_k.csv quarter 123
ei_cphi_m.csv     month   53 
ei_isrt_m.csv     month   15 
namq_aux_lp.csv   quarter 45 
;
run;

%macro courir;

data have;
ladate=input("10/01/2014",ddmmyy10.);
format ladate ddmmyy10.;
run;

/*options SOURCE SOURCE2 MACROGEN SYMBOLGEN MLOGIC MPRINT;*/
data want;
set have;
lannee=year(ladate);
lemois=month(ladate);
run;

data have;
set have;
call symputx("ladate",ladate);
run;

data want;
set want;
call symputx("lannee",lannee);
call symputx("lemois",lemois);
run;

data want1;
  set toto;
  do i=1 by 1 until (date_publ<&ladate);
    date_publ=intnx(periode,&ladate,-1*i,'E')+adddate;
  end;
  drop i;
  format date_publ date9.;
run;



%mend;
%courir;



data want1;
  set toto;
  do i=1 by 1 until (date_publ<&ladate);
    date_publ=intnx(periode,&ladate,-1*i,'E')+adddate;
  end;
  drop i;
  format date_publ today date9.;
run;

