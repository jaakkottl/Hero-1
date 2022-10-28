
proc datasets lib=work kill nolist memtype=data; quit; DM "log; clear;"; DM "output; clear;";
title;
*Saatiin Kevalta puuttumaan j��neet taustatiedot. Vein ne avattuna t�nne:; 

libname phero 'P:\Projektit\HERO-hanke\Datat\Hero_keva_unprotected';
libname hhero 'H:\Hero\datat\keva\keva muokatut';
libname chero 'C:\Users\mahi\Documents\Hero';

*(2 tiedostoa: Keva henkil�tiedot ja Tutkinnot) eli kaikki Kevan avatut tiedot ovat samassa kansiossa.
Lis�ksi tallensin ne salasanasuojatut versiot omaan kansioonsa P:\Projektit\HERO-hanke\Datat\HERO-KEVA-taustatiedot_suojatut;

*Keva henkil�tiedot -> keva_henkilotiedot n=494 (1 tyhj� rivi);
*Tutkinnot -> Tutkinnot n=229 (1 tyhj� rivi);

data hhero.keva_henkilotiedot;
	 infile "H:\Hero\datat\keva\keva muokatut\Keva henkil�tiedot.csv" dlm=';' dsd missover firstobs=2;
	 input
Sukunimi	:$30.
Kutsumanimi	:$20.
numero	:$5.
Syntymaaika		:$10.
Sukupuoli	:$6.
tulopaiva		:$10.
Nimike	:$100.
Tyoaikapros	:$6.
Palvelussuhde	:$20.
Toiminto	:$50.
Yksikko	:$50.
Tiimi	:$100.
email	:$60.
;
	run;

proc contents data=hhero.keva_henkilotiedot varnum short; run;
proc freq data=hhero.keva_henkilotiedot; 
tables _ALL_;
run;




data hhero.keva_Tutkinnot;
	 infile "H:\Hero\datat\keva\keva muokatut\Tutkinnot.csv" dlm=';' dsd missover firstobs=2;
	 input
Sukunimi	:$30.
Kutsumanimi	:$20.
numero	:$5.
email	:$60.	
tutkintonimike	:$100.
;
run;

proc contents data=hhero.keva_Tutkinnot varnum short; run;
proc freq data=hhero.keva_Tutkinnot; 
tables _ALL_;
run;
