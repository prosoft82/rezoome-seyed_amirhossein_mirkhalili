-- اضافه کردن ستون‌های جدید
ALTER TABLE dbo.[labour_force_all] ADD 
    household_number NVARCHAR(2),      -- 2 رقم آخر
    cluster_number NVARCHAR(3),        -- 3 رقم قبل از آن
    urban_rural NVARCHAR(1),           -- 1 رقم قبل از آن
    province_code NVARCHAR(2),         -- 2 رقم قبل از آن
    sample_year NVARCHAR(10);           -- باقی‌مانده (مقابل)
GO

-- به روز رسانی با روش درست
UPDATE dbo.[labour_force_all]
SET 
    -- 2 رقم آخر (سمت راست)
    household_number = RIGHT(pkey, 2),
    
    -- 3 رقم قبل از 2 رقم آخر (با حفظ صفر)
    cluster_number = SUBSTRING(pkey, LEN(pkey) - 4, 3),
    
    -- 1 رقم قبل از آن
    urban_rural = SUBSTRING(pkey, LEN(pkey) - 5, 1),
    
    -- 2 رقم قبل از آن (کد استان)
    province_code = SUBSTRING(pkey, LEN(pkey) - 7, 2),
    
    -- باقی‌مانده از ابتدا تا آنجا (سال)
    sample_year = LEFT(pkey, LEN(pkey) - 8);
