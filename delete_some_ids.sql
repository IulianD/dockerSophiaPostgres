\set numhosts `echo "$PG_NUMHOSTS"`
\set thishost `echo "$PG_THISHOST"`
begin;
delete from synthea_omop.person where person_id % :numhosts = :thishost ;
delete from synthea_omop.measurement where person_id % :numhosts = :thishost ;
delete from synthea_omop.observation where person_id % :numhosts = :thishost ;
delete from synthea_omop.condition_occurrence where person_id % :numhosts = :thishost ;
delete from synthea_omop.condition_era where person_id % :numhosts = :thishost ;
delete from synthea_omop.death where person_id % :numhosts = :thishost ;
delete from synthea_omop.device_exposure where person_id % :numhosts = :thishost ;
delete from synthea_omop.drug_exposure where person_id % :numhosts = :thishost ;
delete from synthea_omop.drug_era where person_id % :numhosts = :thishost ;
delete from synthea_omop.observation_period where person_id % :numhosts = :thishost ;
delete from synthea_omop.procedure_occurrence where person_id % :numhosts = :thishost ;
delete from synthea_omop.visit_occurrence where person_id % :numhosts = :thishost ;
commit;

