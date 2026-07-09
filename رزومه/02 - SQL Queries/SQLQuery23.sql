SELECT 
    'F2_D03' AS ستون,
    COUNT(*) AS کل_سطرها,
    SUM(CASE WHEN F2_D03 IS NULL THEN 1 ELSE 0 END) AS تعداد_NULL
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F2_D04',
    COUNT(*),
    SUM(CASE WHEN F2_D04 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F2_D05',
    COUNT(*),
    SUM(CASE WHEN F2_D05 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F2_D06',
    COUNT(*),
    SUM(CASE WHEN F2_D06 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F2_D07',
    COUNT(*),
    SUM(CASE WHEN F2_D07 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F2_D15',
    COUNT(*),
    SUM(CASE WHEN F2_D15 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F2_D16',
    COUNT(*),
    SUM(CASE WHEN F2_D16 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F2_D17',
    COUNT(*),
    SUM(CASE WHEN F2_D17 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F2_D18',
    COUNT(*),
    SUM(CASE WHEN F2_D18 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F2_D19',
    COUNT(*),
    SUM(CASE WHEN F2_D19 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D01',
    COUNT(*),
    SUM(CASE WHEN F3_D01 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D02',
    COUNT(*),
    SUM(CASE WHEN F3_D02 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D03',
    COUNT(*),
    SUM(CASE WHEN F3_D03 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D04',
    COUNT(*),
    SUM(CASE WHEN F3_D04 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D05',
    COUNT(*),
    SUM(CASE WHEN F3_D05 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D06',
    COUNT(*),
    SUM(CASE WHEN F3_D06 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D07',
    COUNT(*),
    SUM(CASE WHEN F3_D07 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D09',
    COUNT(*),
    SUM(CASE WHEN F3_D09 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D11',
    COUNT(*),
    SUM(CASE WHEN F3_D11 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D13',
    COUNT(*),
    SUM(CASE WHEN F3_D13 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D24',
    COUNT(*),
    SUM(CASE WHEN F3_D24 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D31',
    COUNT(*),
    SUM(CASE WHEN F3_D31 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D33',
    COUNT(*),
    SUM(CASE WHEN F3_D33 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D37MAH',
    COUNT(*),
    SUM(CASE WHEN F3_D37MAH IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D38',
    COUNT(*),
    SUM(CASE WHEN F3_D38 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D47',
    COUNT(*),
    SUM(CASE WHEN F3_D47 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'F3_D49',
    COUNT(*),
    SUM(CASE WHEN F3_D49 IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'IW_Yearly',
    COUNT(*),
    SUM(CASE WHEN IW_Yearly IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'ActivityStatus',
    COUNT(*),
    SUM(CASE WHEN ActivityStatus IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all]
UNION ALL
SELECT 
    'year',
    COUNT(*),
    SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END)
FROM dbo.[labour_force_all];
