
proc datasets lib=work kill nolist memtype=data; quit; DM "log; clear;"; DM "output; clear;";
title;

libname phero 'P:\Projektit\HERO-hanke\Datat\Hero_keva_unprotected';
libname hhero 'H:\Hero\datat\keva\keva muokatut';
libname chero 'C:\Users\mahi\Documents\Hero';
*
Flexim 1.1. - 6.1.2019.xlsx -> keva_Flexim_vk1_2019 n=2981
Flexim 2017.xlsx -> keva_Flexim_2017 n=166161
Flexim 2018.xlsx -> keva_Flexim_2018 n=175618
Henkilönumerot.xlsx 
Nepton  2019.xlsx -> keva_Nepton_2019 n=100331
nepton 1.1. - 30.6.2020.xlsx -> keva_Nepton_2020a n=72812
Nepton 1.7.2020 - 31.12.2020.xlsx -> keva_Nepton_2020b n=64710
Nepton 2021.xlsx -> keva_Nepton_2021 n=133916
;


	data hhero.keva_Flexim_vk1_2019;
	 infile "H:\Hero\datat\keva\keva muokatut\Flexim 1.1. - 6.1.2019.csv" dlm=';' dsd missover firstobs=2;
	 input
Nimi		:$50.
Numero		:$5.
Osasto		:$50.
Jaos		:$50.
Kustp		:$3.
Toimisto		:$50.
Vp		:$2.
Pvm		:$10.
Tunnus		:$1.
Tyoaika		:$10.
Saldo		:$10.
Ylityo		:$10.
Huomautus		:$5.
Leimaukset1		:$10.
Leimaukset2		:$10.
Leimaukset3		:$10.
Leimaukset4		:$10.
Leimaukset5		:$10.
Leimaukset6		:$10.
Leimaukset7		:$10.
Leimaukset8		:$10.
Leimaukset9		:$10.
Leimaukset10		:$10.
;
	run;


proc contents data=hhero.keva_Flexim_vk1_2019 varnum short; run;
proc freq data=hhero.keva_Flexim_vk1_2019; 
tables _ALL_;
run;


	data hhero.keva_Flexim_2017;
	 infile "H:\Hero\datat\keva\keva muokatut\Flexim 2017.csv" dlm=';' dsd missover firstobs=2;
	 input
Nimi		:$50.
Numero		:$5.
Osasto		:$50.
Jaos		:$50.
Kustp		:$3.
Toimisto		:$50.
Vp		:$2.
Pvm		:$10.
Tunnus		:$1.
Tyoaika		:$10.
Saldo		:$10.
Ylityo		:$10.
Huomautus		:$5.
Leimaukset1		:$10.
Leimaukset2		:$10.
Leimaukset3		:$10.
Leimaukset4		:$10.
Leimaukset5		:$10.
Leimaukset6		:$10.
Leimaukset7		:$10.
Leimaukset8		:$10.
Leimaukset9		:$10.
Leimaukset10		:$10.
Leimaukset11		:$10.
Leimaukset12		:$10.
Leimaukset13		:$10.
Leimaukset14		:$10.
Leimaukset15		:$10.
Leimaukset16		:$10.
Leimaukset17		:$10.
Leimaukset18		:$10.
Leimaukset19		:$10.
Leimaukset20		:$10.
Leimaukset21		:$10.
Leimaukset22		:$10.
Leimaukset23		:$10.
Leimaukset24		:$10.
Leimaukset25		:$10.
Leimaukset26		:$10.
Leimaukset27		:$10.
Leimaukset28		:$10.
Leimaukset29		:$10.
Leimaukset30		:$10.
Leimaukset31		:$10.
Leimaukset32		:$10.
Leimaukset33		:$10.
Leimaukset34		:$10.
Leimaukset35		:$10.
;
	run;



proc contents data=hhero.keva_Flexim_2017 varnum short; run;
proc freq data=hhero.keva_Flexim_2017; 
tables _ALL_;
run;



	data hhero.keva_Flexim_2018;
	 infile "H:\Hero\datat\keva\keva muokatut\Flexim 2018.csv" dlm=';' dsd missover firstobs=2;
	 input
Nimi		:$50.
Numero		:$5.
Osasto		:$50.
Jaos		:$50.
Kustp		:$3.
Toimisto		:$50.
Vp		:$2.
Pvm		:$10.
Tunnus		:$1.
Tyoaika		:$10.
Saldo		:$10.
Ylityo		:$10.
Huomautus		:$5.
Leimaukset1		:$10.
Leimaukset2		:$10.
Leimaukset3		:$10.
Leimaukset4		:$10.
Leimaukset5		:$10.
Leimaukset6		:$10.
Leimaukset7		:$10.
Leimaukset8		:$10.
Leimaukset9		:$10.
Leimaukset10		:$10.
Leimaukset11		:$10.
Leimaukset12		:$10.
Leimaukset13		:$10.
Leimaukset14		:$10.
Leimaukset15		:$10.
Leimaukset16		:$10.
Leimaukset17		:$10.
Leimaukset18		:$10.
Leimaukset19		:$10.
Leimaukset20		:$10.
;
	run;


proc contents data=hhero.keva_Flexim_2018 varnum short; run;
proc freq data=hhero.keva_Flexim_2018; 
tables _ALL_;
run;
proc print data=hhero.keva_Flexim_2018 noobs;
title 'keva_Flexim_2018';
where Leimaukset10 ne ''; *Leimaukset10 eteenpäin vain päivämääriä;
run;


data keva_Flexim(drop=tyoaika_tunnit tyoaika_minuutit Leimaukset32 Leimaukset33 Leimaukset34 Leimaukset35);
set hhero.keva_Flexim_2017(in=d17) hhero.keva_Flexim_2018(in=d18) hhero.keva_Flexim_vk1_2019(in=d19);

attrib aineisto length=$10 label='mistä excelistä yhdistetty';
if d17=1 then aineisto='F 2017';
if d18=1 then aineisto='F 2018';
if d19=1 then aineisto='F 2019';

tyoaika_tunnit=scan(tyoaika, 1, ':')*1;
tyoaika_minuutit=scan(tyoaika, -1, ':')*0.016667;

attrib TV_pituusT length=8 label='Työvuoron pituus tunteina'; if tyoaika ne '' then do; TV_pituusT=tyoaika_tunnit+tyoaika_minuutit; end;
TV_pituusT=round(TV_pituusT, 0.01);

*Pvm muotoa 01.01.2017;
vuosi = substr(Pvm, 7,4);
kk = substr(Pvm,4,2);
pva = substr(Pvm, 1, 2);

*ei leimauskellonaikaa;

Pvm_mm_yy=CATT(kk, "/", vuosi);

		AHETKI_PVM=mdy((kk*1),(pva*1),(vuosi*1));
			format AHETKI_PVM ddmmyy10.;

run;


proc sort data=keva_Flexim out=keva_Flexim_1 NODUPKEY; * 0 observations with duplicate key values were deleted.;
		by Nimi Numero Osasto Jaos Kustp Toimisto Vp Pvm Tunnus Tyoaika Saldo Ylityo Huomautus Leimaukset1 Leimaukset2 Leimaukset3 Leimaukset4 Leimaukset5 
Leimaukset6 Leimaukset7 Leimaukset8 Leimaukset9 Leimaukset10 Leimaukset11 Leimaukset12 Leimaukset13 Leimaukset14 Leimaukset15 Leimaukset16 Leimaukset17 Leimaukset18 Leimaukset19 
Leimaukset20 Leimaukset21 Leimaukset22 Leimaukset23 Leimaukset24 Leimaukset25 Leimaukset26 Leimaukset27 Leimaukset28 Leimaukset29 Leimaukset30 Leimaukset31 aineisto TV_pituusT;
	run;
data hhero.keva_Flexim(drop=kk pva);
set keva_Flexim_1;
run;

options nodate pageno=1 nocenter orientation=portrait PAPERSIZE=a4;
ods rtf file='H:\Hero\datat\keva\keva_Flexim_tarkastelua.rtf' style=minimal;
proc contents data=hhero.keva_Flexim varnum; run;
proc freq data=hhero.keva_Flexim;
tables aineisto Pvm_mm_yy;
run;
	proc sql;
	  CREATE TABLE keva_Flexim_numero AS
	  select vuosi, count(distinct Numero) as Numeroid_N
	  from hhero.keva_Flexim
	  group by vuosi
	  order by vuosi;
	quit;
	proc print data=keva_Flexim_numero noobs;
	run;
proc means data=hhero.keva_Flexim maxdec=1 min p25 mean median mode p75 max std;
title 'keva_Flexim 2017, 2018, 2019';
class tunnus;
var TV_pituusT;
run;
ods rtf close;

*EI peräkkäisiä eikä sisäkkäisiä leimauksia samana päivänä;
proc sql;
create table f_dup as
select * from chero.keva_Flexim
group by numero, pvm
having count(*) >= 2
;
quit;
proc contents data=hhero.keva_Flexim varnum short; run;


*alkupäivät loppupäivät/vuosi id-lkm/vuosi;


data hhero.keva_Nepton_2019;
	 infile "H:\Hero\datat\keva\keva muokatut\Nepton  2019.csv" dlm=';' dsd missover firstobs=2;
	 input
numero	:$5.
nimi	:$50.
Tapahtumatyyppi	:$50.
Kirjauspaiva	:$10.
TV_AHETKI	:$20.
TV_LHETKI	:$20.
Tyoaika	:$10.
;
	run;

proc contents data=hhero.keva_Nepton_2019 varnum short; run;
proc freq data=hhero.keva_Nepton_2019; 
tables _ALL_;
run;


data hhero.keva_Nepton_2020a;
	 infile "H:\Hero\datat\keva\keva muokatut\nepton 1.1. - 30.6.2020.csv" dlm=';' dsd missover firstobs=2;
	 input
numero	:$5.
nimi	:$50.
Tapahtumatyyppi	:$50.
Kirjauspaiva	:$10.
TV_AHETKI	:$20.
TV_LHETKI	:$20.
Tyoaika	:$10.
;
	run;

proc contents data=hhero.keva_Nepton_2020a varnum short; run;
proc freq data=hhero.keva_Nepton_2020a; 
tables _ALL_;
run;


data hhero.keva_Nepton_2020b;
	 infile "H:\Hero\datat\keva\keva muokatut\Nepton 1.7.2020 - 31.12.2020.csv" dlm=';' dsd missover firstobs=2;
	 input
numero	:$5.
nimi	:$50.
Tapahtumatyyppi	:$50.
Kirjauspaiva	:$10.
TV_AHETKI	:$20.
TV_LHETKI	:$20.
Tyoaika	:$10.
;
	run;

proc contents data=hhero.keva_Nepton_2020b varnum short; run;
proc freq data=hhero.keva_Nepton_2020b; 
tables _ALL_;
run;


data hhero.keva_Nepton_2021;
	 infile "H:\Hero\datat\keva\keva muokatut\Nepton 2021.csv" dlm=';' dsd missover firstobs=2;
	 input
numero	:$5.
nimi	:$50.
Tapahtumatyyppi	:$50.
Kirjauspaiva	:$10.
TV_AHETKI	:$20.
TV_LHETKI	:$20.
Tyoaika	:$10.
;
	run;

proc contents data=hhero.keva_Nepton_2021 varnum short; run;
proc freq data=hhero.keva_Nepton_2021; 
tables _ALL_;
run;

data keva_Nepton(drop=Apva Akk Am Ah As Lpva Lkk Lvuosi Lm Lh Ls);
set hhero.keva_Nepton_2019(in=d19) hhero.keva_Nepton_2020a(in=d20a) hhero.keva_Nepton_2020b(in=d20b) hhero.keva_Nepton_2021(in=d21);

if numero ne '';
if TV_AHETKI ne '' or TV_LHETKI ne '';

attrib aineisto length=$10 label='mistä excelistä yhdistetty';
if d19=1 then aineisto='N 2019';
if d20a=1 then aineisto='N 2020 A';
if d20b=1 then aineisto='N 2020 B';
if d21=1 then aineisto='N 2021';

TV_pituusT=tranwrd(tyoaika, ",", ".")*1;


*TV_AHETKI muotoa 7.1.2019 08:00;
Apva = scan(TV_AHETKI, 1, '.');
Akk = scan(TV_AHETKI, 2, '.');
Avuosi =reverse(substr(strip(reverse(TV_AHETKI)), 7, 4));
Am=reverse(substr(strip(reverse(TV_AHETKI)), 1, 2));
Ah=reverse(substr(strip(reverse(TV_AHETKI)), 4, 2));
As='00';

Lpva = scan(TV_LHETKI, 1, '.');
Lkk = scan(TV_LHETKI, 2, '.');
Lvuosi =reverse(substr(strip(reverse(TV_LHETKI)), 7, 4));
Lm=reverse(substr(strip(reverse(TV_LHETKI)), 1, 2));
Lh=reverse(substr(strip(reverse(TV_LHETKI)), 4, 2));
Ls='00';

AHETKI_mm_yy=CATT(akk, "/", avuosi);

		AHETKI_PVM=mdy((akk*1),(apva*1),(avuosi*1));
			format AHETKI_PVM ddmmyy10.;
		TV_AKLO_TOT=HMS((Ah*1),(Am*1),(As*1));
		format TV_AKLO_TOT time8.;

		LHETKI_PVM=mdy((lkk*1),(lpva*1),(lvuosi*1));
			format LHETKI_PVM ddmmyy10.;
		TV_LKLO_TOT=HMS((Lh*1),(Lm*1),(Ls*1));
		format TV_LKLO_TOT time8.;

run;

proc sort data=keva_Nepton out=keva_Nepton_1 NODUPKEY; * 237 observations with duplicate key values were deleted.;
		by numero nimi Tapahtumatyyppi Kirjauspaiva TV_AHETKI TV_LHETKI Tyoaika aineisto TV_pituusT;
	run;

data hhero.keva_Nepton;
set keva_Nepton_1;
run;

options nodate pageno=1 nocenter orientation=portrait PAPERSIZE=a4;
ods rtf file='H:\Hero\datat\keva\Keva_Nepton_tarkastelua.rtf' style=minimal;
proc contents data=hhero.keva_Nepton varnum; run;
proc freq data=hhero.keva_Nepton; tables aineisto; run;
proc sort data=hhero.keva_Nepton out=leimaus; by AHETKI_PVM;
proc freq data=leimaus order=data; tables AHETKI_mm_yy; run;

proc sql;
	  CREATE TABLE Nepton_leimaukset_numero AS
	  select Avuosi, count(distinct numero) as numero_N
	  from hhero.keva_Nepton
	  group by Avuosi
	  order by Avuosi;
	quit;
	proc print data=Nepton_leimaukset_numero noobs;
	run;
ods rtf close;


*peräkkäisiä ja sisäkkäisiä leimauksia samana päivänä esim. numero 30665 kirjauspaiva=3.2.2019;
proc sql;
create table n_dup as
select * from keva_Nepton
group by numero, kirjauspaiva
having count(*) >= 2
;
quit;

data keva_Nepton_2019;
set hhero.keva_Nepton_2019;
attrib tyoaika_num length=8; if tyoaika ne '' then do; tyoaika_num=tyoaika*1; end;
run;
proc freq data=hhero.keva_Nepton;
title 'keva_Nepton_2019: tyoaika eq .';
where tyoaika eq ''; *tyoaika tyhja;
tables Tapahtumatyyppi*tyoaika /list missing;
run;
proc means data=chero.keva_Nepton maxdec=1 min p25 mean median p75 max std;
title 'keva_Nepton';
class Tapahtumatyyppi;
var TV_pituusT;
run;
proc print data=keva_Nepton_2019 ;
where Tapahtumatyyppi in('Etätyö','Työ') and tyoaika_num=0; *aloitushetki=lopetushetki, päällekkäisiä leimauksia;
run;



