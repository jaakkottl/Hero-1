
libname hheroHY 'H:\Hero\datat\hy\HY muokatut';


/*
HY muokatut\Meilahden YPA_työaikaprosentit 1.1.2019-2.3.2022 -> YPA_prosentit_2019_2022a n=436
Meilahden labrahenkilöstö_työaikaprosentit 1.1.2019-2.3.2022 -> LABRA_prosentit_2019_2022a n=485

tutkintotiedot_meilahden labrahenkilöstö.XLSX -> tutkintotiedot_labra n=162
tutkintotiedot_meilahden YPA.XLSX -> tutkintotiedot_YPA n=202

Meilahden YPA_leimaukset 2019 -> YPA_leimaukset2019 n=37759
Meilahden YPA_leimaukset 1.10.-31.12.2021 -> n=14071
Meilahden YPA_leimaukset 1.10.-31.12.2020 -> n=13574
Meilahden YPA_leimaukset 1.7.-30.9.2021 -> n=11282
Meilahden YPA_leimaukset 1.7.-30.9.2020 -> n=11072
Meilahden YPA_leimaukset 1.1.2022-2.3.2022 -> n=9497
Meilahden YPA_leimaukset 1.1.-30.6.2021 -> n=26952
Meilahden YPA_leimaukset 1.1.-30.6.2020 -> n=24267

Meilahden labrahenkilöstö_leimaukset 2019 -> n=27931
Meilahden labrahenkilöstö_leimaukset 2020 -> n=32176
Meilahden labrahenkilöstö_leimaukset 2021 -> n=36605
Meilahden labrahenkilöstö_leimaukset 1.1.2022-2.3.2022 -> n=6935

Meilahden YPA 2.3.2022_lopullinen tutkimusjoukko -> n=
Meilahden labrahenkilöstö 2.3.2022_lopullinen tutkimusjoukko -> n=

Meilahden YPA_poissaolot 1.1.2019-2.3.2022 -> n=
Meilahden labrahenkilöstö_poissaolot 1.1.2019-2.3.2022 -> n=


*/

data hheroHY.YPA_prosentit_2019_2022a;
	 infile "H:\Hero\datat\hy\HY muokatut\Meilahden YPA_työaikaprosentit 1.1.2019-2.3.2022.csv" dlm=';' dsd missover firstobs=2;
	 input
Email	:$60.
PERSONID_EXT	:$10.
HloNro	:$10.
Henkilonumero	:$50.
Ts_alkupvm	:$20.
Ts_loppupvm	:$20.
HoitoPros_alkupvm	:$20.
HoitoPros_loppupvm	:$20.
HoitoPros	:$10.
;
	run;

	proc sql;
	  CREATE TABLE PERSONID_EXT_by_YPA AS
	  select count(distinct PERSONID_EXT) as PERSONID_EXT_N
	  from hheroHY.YPA_prosentit_2019_2022a
	quit;
	proc print data=PERSONID_EXT_by_YPA noobs;
	run;

/*proc sort data=hheroHY.YPA_prosentit_2019_2022a out=keva_Flexim NODUPKEY; * 0 observations with duplicate key values were deleted.;
		by PERSONID_EXT;
	run;*/
	
data hheroHY.LABRA_prosentit_2019_2022a;
	 infile "H:\Hero\datat\hy\HY muokatut\Meilahden labrahenkilöstö_työaikaprosentit 1.1.2019-2.3.2022.csv" dlm=';' dsd missover firstobs=2;
	 input
Email	:$60.
PERSONID_EXT	:$10.
HloNro	:$10.
Henkilonumero	:$50.
Ts_alkupvm	:$20.
Ts_loppupvm	:$20.
HoitoPros_alkupvm	:$20.
HoitoPros_loppupvm	:$20.
HoitoPros	:$10.
;
	run;


	proc sql;
	  CREATE TABLE PERSONID_EXT_by_LABRA AS
	  select count(distinct PERSONID_EXT) as PERSONID_EXT_N
	  from hheroHY.LABRA_prosentit_2019_2022a
	quit;
	proc print data=PERSONID_EXT_by_LABRA noobs;
	run;

	
data hheroHY.tutkintotiedot_labra;
	 infile "H:\Hero\datat\hy\HY muokatut\tutkintotiedot_meilahden labrahenkilöstö.csv" dlm=';' dsd missover firstobs=2;
	 input
Email	:$60.
PERSONID_EXT	:$10.
HloNro	:$10.
Nimi	:$100.
SL	:$3.
Oppilaitoslaji	:$60.
Koul	:$10.
Koulutus_selite	:$100.
Suorituspvm	:$10.
;
	run;

data hheroHY.tutkintotiedot_YPA;
	 infile "H:\Hero\datat\hy\HY muokatut\tutkintotiedot_meilahden YPA.csv" dlm=';' dsd missover firstobs=2;
	 input
Email	:$60.
PERSONID_EXT	:$10.
HloNro	:$10.
Nimi	:$100.
SL	:$3.
Oppilaitoslaji	:$60.
Koul	:$10.
Koulutus_selite	:$100.
Suorituspvm	:$10.
;
	run;

data hheroHY.YPA_leimaukset2019;
	 infile "H:\Hero\datat\hy\HY muokatut\Meilahden YPA_leimaukset 2019.csv" dlm=';' dsd missover firstobs=2;
	 input
Email	:$60.
PERSONID_EXT	:$10.
HloNro	:$10.
Nimi	:$100.
Ts_alkupvm	:$20.
Ts_loppupvm	:$20.
Leimauspvm	:$20.
Leimauskellonaika	:$20.
Leimauskoodi	:$5.
Aikatapahtumalaji	:$60.
LOPO	:$10.
;
	run;



	Meilahden YPA_leimaukset 1.10.-31.12.2021
	Meilahden YPA_leimaukset 1.10.-31.12.2020
	Meilahden YPA_leimaukset 1.7.-30.9.2021
	Meilahden YPA_leimaukset 1.7.-30.9.2020
	Meilahden YPA_leimaukset 1.1.2022-2.3.2022
	Meilahden YPA_leimaukset 1.1.-30.6.2021
	Meilahden YPA_leimaukset 1.1.-30.6.2020
	Meilahden labrahenkilöstö_leimaukset 2021
	Meilahden labrahenkilöstö_leimaukset 2020
	Meilahden labrahenkilöstö_leimaukset 2019
	Meilahden labrahenkilöstö_leimaukset 1.1.2022-2.3.2022
