INSERT INTO mhsa_commodity_lookup
(
cmmdty_cd,
cmmdty_desc,
naics_cd,
sffx_cd,
old_sic_cd,
actv_ind,
actv_dt,
inactv_dt
)
SELECT 
cmmdty_cd,
cmmdty_desc,
naics_cd,
sffx_cd,
old_sic_cd,
actv_ind,
actv_dt,
inactv_dt
FROM MSHA_Full;

select *
from Contractor;