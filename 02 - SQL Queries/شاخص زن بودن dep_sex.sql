ALTER TABLE dbo.[labour_force_all] ADD dep_sex INT;
GO
UPDATE dbo.[labour_force_all]
SET dep_sex = CASE 
    -- شرط 1: زن بودن
    WHEN F2_D04 = 2 THEN 1

    ELSE 0
END;