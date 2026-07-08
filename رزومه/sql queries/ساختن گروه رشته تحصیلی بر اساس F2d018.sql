-- حذف ستون
ALTER TABLE dbo.[labour_force_all] DROP COLUMN IF EXISTS education_group;
GO

-- اضافه کردن ستون
ALTER TABLE dbo.[labour_force_all] ADD education_group NVARCHAR(100);
GO

-- به روز رسانی با LIKE و ELSE NULL
UPDATE dbo.[labour_force_all]
SET education_group = CASE 
    WHEN F2_D18 LIKE '01%' OR F2_D18 LIKE '00%' THEN 'Education'
    WHEN F2_D18 LIKE '02%' THEN 'Arts and Humanities'
    WHEN F2_D18 LIKE '03%' THEN 'Social and Behavioural Sciences'
    WHEN F2_D18 LIKE '04%' THEN 'Business and Law'
    WHEN F2_D18 LIKE '05%' THEN 'Natural Sciences'
    WHEN F2_D18 LIKE '06%' THEN 'ICT'
    WHEN F2_D18 LIKE '07%' THEN 'Engineering and Manufacturing'
    WHEN F2_D18 LIKE '08%' THEN 'Agriculture and Veterinary'
    WHEN F2_D18 LIKE '09%' THEN 'Health and Welfare'
    WHEN F2_D18 LIKE '10%' THEN 'Services'
    ELSE NULL
END;