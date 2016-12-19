select * from Column_Rename;

select * from msha_full;

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'oper_id'
WHERE COLUMN_OLD = 'msha_controller_history_oper_id'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'ctrlr_nm'
WHERE COLUMN_OLD = 'msha_controller_history_ctrlr_nm'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'ctrlr_end_dt'
WHERE COLUMN_OLD = 'msha_controller_history_ctrlr_end_dt'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'oper_nm'
WHERE COLUMN_OLD = 'msha_controller_history_oper_nm'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'ctrlr_start_dt'
WHERE COLUMN_OLD = 'msha_controller_history_ctrlr_start_dt'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'ctrlr_id'
WHERE COLUMN_OLD = 'msha_controller_history_ctrlr_id'

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

IF OBJECT_ID (N'dbo.[mhsa_controller_history]', N'U') IS NOT NULL
DROP TABLE dbo.[mhsa_controller_history];
GO
CREATE TABLE [dbo].[mhsa_controller_history](
	[ctrlr_end_dt] [varchar](500) NULL,
	[ctrlr_id] [varchar](500) NULL,
	[ctrlr_nm] [varchar](500) NULL,
	[ctrlr_start_dt] [varchar](500) NULL,
	[indstry_dim_id] [varchar](500) NULL,
	[load_dt] [varchar](500) NULL,
	[oper_id] [varchar](500) NULL,
	[oper_nm] [varchar](500) NULL,
	[state_dim_id] [varchar](500) NULL,
)


INSERT INTO Contractor
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
