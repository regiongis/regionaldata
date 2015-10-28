CREATE MATERIALIZED VIEW kibana.cvr_produktionsenhed AS 
 SELECT row_number() OVER () AS gid,
    cvr.modifikationsstatus,
    cvr.livsforloeb_startdato::timestamp without time zone AS "Livsforløb startdato",
    cvr.livsforloeb_ophoersdato::timestamp without time zone AS "Livsforløb ophørsdato",
    cvr.ajourfoeringsdato::timestamp without time zone AS "Ajourføringsdato",
    cvr.virksomhed_gyldigfra::timestamp without time zone AS "Virksomhed gyldig fra",
    cvr.virksomhed_cvrnr AS "CVR-nummer",
    cvr.pnr AS "P-nummer",
    cvr.navn_tekst AS "Virksomhedsnavn",
    cvr.navn_gyldigfra::timestamp without time zone AS "Navn gyldig fra",
    cvr.reklamebeskyttelse,
    cvr.beliggenhedsadresse_gyldigfra::timestamp without time zone AS "Beliggenhedsadresse gyldig fra",
    cvr.beliggenhedsadresse_vejnavn AS "Vejnavn",
    cvr.beliggenhedsadresse_vejkode AS "Vejkode",
    cvr.beliggenhedsadresse_husnummerfra AS "Husnummer fra",
    cvr.beliggenhedsadresse_husnummertil AS "Husnummer til",
    cvr.beliggenhedsadresse_bogstavfra AS "Bogstav fra",
    cvr.beliggenhedsadresse_bogstavtil AS "Bogstav til",
    cvr.beliggenhedsadresse_etage AS "Etage",
    cvr.beliggenhedsadresse_sidedoer AS "Side/dør",
    cvr.beliggenhedsadresse_postnr AS "Postnummer",
    cvr.beliggenhedsadresse_postdistrikt AS "Postdistrikt",
    cvr.beliggenhedsadresse_bynavn AS "Bynavn",
    cvr.kommune_kode AS "Kommunekode",
    adr."Kommunenavn",
    cvr.beliggenhedsadresse_postboks AS "Postboks",
    cvr.beliggenhedsadresse_conavn AS "CO navn",
    cvr.beliggenhedsadresse_adressefritekst AS "Adresse fritekst",
    cvr.hovedbranche_gyldigfra::timestamp without time zone AS "Hovedbranche gyldig fra",
    cvr.hovedbranche_kode AS "Hovedbranche (kode)",
    cvr.hovedbranche_tekst AS "Hovedbranche (tekst)",
    cvr.bibranche1_gyldigfra::timestamp without time zone AS "Bibranche 1 gyldig fra",
    cvr.bibranche1_kode AS "Bibranche 1 (kode)",
    cvr.bibranche1_tekst AS "Bibranche 1 (tekst)",
    cvr.bibranche2_gyldigfra::timestamp without time zone AS "Bibranche 2 gyldig fra",
    cvr.bibranche2_kode AS "Bibranche 2 (kode)",
    cvr.bibranche2_tekst AS "Bibranche 2 (tekst)",
    cvr.bibranche3_gyldigfra::timestamp without time zone AS "Bibranche 3 gyldig fra",
    cvr.bibranche3_kode AS "Bibranche 3 (kode)",
    cvr.bibranche3_tekst AS "Bibranche 3 (tekst)",
    cvr.telefonnummer_gyldigfra::timestamp without time zone AS "Telefonnummer gyldig fra",
    cvr.telefonnummer_kontaktoplysning AS "Telefonnummer",
    cvr.email_gyldigfra::timestamp without time zone AS "E-mail gyldig fra",
    cvr.email_kontaktoplysning AS "E-mail",
    cvr.aarsbeskaeftigelse_aar AS "År (Årsbeskæftigelse)",
    cvr.aarsbeskaeftigelse_antalansatte AS "Antal ansatte (Årsbeskæftigelse)",
    cvr.aarsbeskaeftigelse_antalansatteinterval AS "Antal ansatte i interval (Årsbeskæftigelse)",
    cvr.aarsbeskaeftigelse_antalaarsvaerk AS "Antal årsværk (Årsbeskæftigelse)",
    cvr.aarsbeskaeftigelse_antalaarsvaerkinterval AS "Antal årsværk i interval (Årsbeskæftigelse)",
    cvr.aarsbeskaeftigelse_antalinclejere AS "Antal incl. ejere (Årsbeskæftigelse)",
    cvr.aarsbeskaeftigelse_antalinclejereinterval AS "Antal incl. ejere i interval (Årsbeskæftigelse)",
    cvr.kvartalsbeskaeftigelse_aar AS "År (Kvartalsbeskaeftigelse)",
    cvr.kvartalsbeskaeftigelse_kvartal AS "Kvartal (Kvartalsbeskaeftigelse)",
    cvr.kvartalsbeskaeftigelse_antalansatte AS "Antal ansatte (Kvartalsbeskaeftigelse)",
    cvr.kvartalsbeskaeftigelse_antalansatteinterval AS "Antal ansatte i interval (Kvartalsbeskaeftigelse)",
    cvr.kvartalsbeskaeftigelse_antalaarsvaerk AS "Antal årsværk (Kvartalsbeskaeftigelse)",
    cvr.kvartalsbeskaeftigelse_antalaarsvaerkinterval AS "Antal årsværk i interval (Kvartalsbeskaeftigelse)",
    cvr.maanedsbeskaeftigelse_aar AS "År (Månedsbeskaeftigelse)",
    cvr.maanedsbeskaeftigelse_maaned AS "Måned (Månedsbeskaeftigelse)",
    cvr.maanedsbeskaeftigelse_antalansatte AS "Antal ansatte (Månedsbeskaeftigelse)",
    cvr.maanedsbeskaeftigelse_antalansatteinterval AS "Antal ansatte i interval (Månedsbeskaeftigelse)",
    cvr.maanedsbeskaeftigelse_antalaarsvaerk AS "Antal årsværk (Månedsbeskaeftigelse)",
    cvr.maanedsbeskaeftigelse_antalaarsvaerkinterval AS "Antal årsværk i interval (Månedsbeskaeftigelse)",
    cvr.hovedafdeling AS "Hovedafdeling",
    cvr.deltagere,
    adr."Sognnnr",
    adr."Sognnavn",
    adr.kn100mdk,
    adr.kn1kmdk,
    adr.kn10kmdk,
    adr."Bebyggelsestype",
    adr."Lokalplannr",
    adr."Lokalplannavn",
    adr."Lokalplan anvendelsespecifik",
    adr."Lokalplan zonestatus",
    adr."Lokalplan link",
    adr.the_geom
   FROM cvr.cvr_prod_enhed cvr
     JOIN _00_grundkort.adresser_adm_rh2 adr ON concat(cvr.kommune_kode, lpad(cvr.beliggenhedsadresse_vejkode::text, 4, '0'::text), lpad(cvr.beliggenhedsadresse_husnummerfra::text, 3, '0'::text), cvr.beliggenhedsadresse_bogstavfra) = adr.adr_id::text;
