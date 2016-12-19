select * from MSHA_Full

select * from Column_Rename

ALTER TABLE msha_full DROP COLUMN 
oper_id,
ctrlr_id,
ctrlr_start_dt,
ctrlr_nm,
ctrlr_end_dt,
oper_nm


DELETE FROM Column_Rename WHERE Column_New IN ( 
'oper_id',
'ctrlr_id',
'ctrlr_start_dt',
'ctrlr_nm',
'ctrlr_end_dt',
'oper_nm'

)


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'cmmdty_cd'
WHERE COLUMN_OLD = 'msha_commodity_lookup_cmmdty_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'cmmdty_desc'
WHERE COLUMN_OLD = 'msha_commodity_lookup_cmmdty_desc'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'naics_cd'
WHERE COLUMN_OLD = 'msha_commodity_lookup_naics_cd'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'sffx_cd'
WHERE COLUMN_OLD = 'msha_commodity_lookup_sffx_cd'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'old_sic_cd'
WHERE COLUMN_OLD = 'msha_commodity_lookup_old_sic_cd'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'actv_ind'
WHERE COLUMN_OLD = 'msha_commodity_lookup_actv_ind'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'actv_dt'
WHERE COLUMN_OLD = 'msha_commodity_lookup_actv_dt'


UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'inactv_dt'
WHERE COLUMN_OLD = 'msha_commodity_lookup_inactv_dt'

--HERE

UPDATE COLUMN_RENAME 
SET Column_Old= 'lookup_inactv_dt'
WHERE Column_New = 'inactv_dt'

UPDATE COLUMN_RENAME 
SET Column_Old= 'lookup_cmmdty_cd'
WHERE Column_New = 'cmmdty_cd'


UPDATE COLUMN_RENAME 
SET Column_Old= 'lookup_cmmdty_desc'
WHERE Column_New = 'cmmdty_desc'

UPDATE COLUMN_RENAME 
SET Column_Old= 'lookup_naics_cd'
WHERE Column_New = 'naics_cd'

UPDATE COLUMN_RENAME 
SET Column_Old= 'lookup_sffx_cd'
WHERE Column_New = 'sffx_cd'

UPDATE COLUMN_RENAME 
SET Column_Old= 'lookup_old_sic_cd'
WHERE Column_New = 'old_sic_cd'


UPDATE COLUMN_RENAME 
SET Column_Old= 'lookup_actv_ind'
WHERE Column_New = 'actv_ind'

UPDATE COLUMN_RENAME 
SET Column_Old= 'lookup_actv_dt'
WHERE Column_New = 'actv_dt'

declare commands cursor for
Select ('exec sp_Rename ''MSHA_Full.[' + Column_Old + ']'',''' + Column_new + ''', ''Column'';') as Statement
from Column_Rename

declare @cmd varchar(max)

open commands
fetch next from commands into @cmd
while @@FETCH_STATUS=0
begin
  exec(@cmd)
  fetch next from commands into @cmd
end

close commands
deallocate commands


IF OBJECT_ID (N'dbo.[mhsa_commodity_lookup]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_commodity_lookup];
GO
CREATE TABLE [dbo].[mhsa_commodity_lookup](
	[actv_dt] [varchar](500) NULL,
	[actv_ind] [varchar](500) NULL,
	[cmmdty_cd] [varchar](500) NULL,
	[cmmdty_desc] [varchar](500) NULL,
	[inactv_dt] [varchar](500) NULL,
	[naics_cd] [varchar](500) NULL,
	[old_sic_cd] [varchar](500) NULL,
	[sffx_cd] [varchar](500) NULL,
	[sic_cd] [varchar](500) NULL,
)  ON [PRIMARY]