Use MSHA;
Go

Update MSHA_FUll
SET ["msha_Inspect_event_no"] = REPLACE(["msha_Inspect_event_no"],'"', '')


IF OBJECT_ID (N'dbo.Column_Rename', N'U') IS NOT NULL
DROP TABLE dbo.Column_Rename;
GO

CREATE TABLE [dbo].[Column_Rename](
	[Column_Old] [varchar](50) NULL,
	[Column_New] [varchar](50) NULL
) ON [PRIMARY]

SET ansi_warnings OFF
GO

/* Insert existing name into table */
DECLARE 
@TABLENAME VARCHAR(50)

SELECT @TABLENAME = 'MSHA_Full'

insert into dbo.Column_Rename (Column_Old)
	SELECT column_Name
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = @TABLENAME
	and data_Type in ('varchar')

SELECT Column_Old
	from Column_Rename

/* Insert name into second column */
DECLARE 
@TABLENAME VARCHAR(50)

SELECT @TABLENAME = 'MSHA_Full'

Update dbo.Column_Rename SET Column_New = i.COLUMN_NAME
From (
	SELECT column_Name
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = @TABLENAME
		and data_Type in ('varchar')) as i
Where i.COLUMN_NAME = Column_Rename.Column_Old

/* Remove Double Quotes from New ColumnName */
Update Column_Rename
SET Column_New = REPLACE(Column_New,'"', '')

/* Create Rename Statements */
Select ('exec sp_Rename ''MSHA_Full.[' + Column_Old + ']'',''' + Column_new + ''', ''Column'';') as Statement
from Column_Rename

/* Create Rename Cursor */
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



/*Final Step  
1. Copy the results to a new query
2. Copy tab (4 spaces after [
3. Paste it into an replace all
4. Execute the replace all
5. Execute Script
*

Dtexecui from Command Line