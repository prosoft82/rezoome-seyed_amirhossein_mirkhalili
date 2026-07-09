DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql = @sql + 
    'UPDATE dbo.[labour_force_all] SET ' + QUOTENAME(COLUMN_NAME) + ' = NULL 
     WHERE ' + QUOTENAME(COLUMN_NAME) + ' = '''' OR ' + QUOTENAME(COLUMN_NAME) + ' = ''--''; '
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'labour_force_all';

EXEC sp_executesql @sql;
