--Patients With a Condition
select *
from patients
where regexp_like(conditions,'^DIAB1|(\sDIAB1)')
/* Write your PL/SQL query statement below */
select patient_id, patient_name, conditions--,substr(conditions,1,5)
from patients
where regexp_like(conditions,'[ ](DIAB1)') or  regexp_like(conditions,'^(DIAB1)')
