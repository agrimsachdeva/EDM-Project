UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'cntctr_id'
WHERE COLUMN_OLD = 'msha_contractor_cntctr_id'

UPDATE COLUMN_RENAME 
SET COLUMN_NEW= 'cntctr_nm'
WHERE COLUMN_OLD = 'msha_contractor_cntctr_nm'

--create
IF OBJECT_ID (N'dbo.Contractor', N'U') IS NOT NULL
DROP TABLE dbo.Contractor;
GO
CREATE TABLE [dbo].[Contractor](
	[cntctr_id] [varchar](500) NOT NULL,
	[cntctr_nm] [varchar](500) NULL,
	[indstry_dim_id] [integer] NULL,
	[zip_dim_id] [integer] NULL,
)  ON [PRIMARY]




select *
from Column_Rename;





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



INSERT INTO Contractor
(
cntctr_id,
cntctr_nm
)
SELECT 
cntctr_id,
cntctr_nm
FROM MSHA_Full;

select *
from Contractor;