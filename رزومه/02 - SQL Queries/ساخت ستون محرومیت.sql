ALTER TABLE dbo.[labour_force_all] DROP COLUMN IF EXISTS deprived;
GO
ALTER TABLE dbo.[labour_force_all] ADD deprived INT;
GO
UPDATE dbo.[labour_force_all]
SET deprived = CASE 
    -- شرط 1: بیکار
    WHEN ActivityStatus = 2 THEN 1
    
    -- شرط 2: غیرفعال به جز بازنشسته و محصل
    WHEN F3_D47 = 2
		 or F3_D47 = 4
		 or F3_D47 = 5
		 then 1
    
    -- شرط 3: کار جزئی با درآمد نامناسب
    WHEN F3_D02 = 1
	or F3_D03 = 1
	or F3_D04 = 1
	or F3_D05 = 1
	or F3_D06 = 1
		then 1
    
    ELSE 0
END;
