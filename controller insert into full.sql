INSERT INTO mhsa_controller_history
(
oper_id,
ctrlr_id,
ctrlr_start_dt,
ctrlr_nm,
ctrlr_end_dt,
oper_nm
)
SELECT 
oper_id,
ctrlr_id,
ctrlr_start_dt,
ctrlr_nm,
ctrlr_end_dt,
oper_nm
FROM MSHA_Full;
