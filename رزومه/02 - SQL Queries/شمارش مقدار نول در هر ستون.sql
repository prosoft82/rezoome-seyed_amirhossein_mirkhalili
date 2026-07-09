SELECT 
    COUNT(*) AS کل_سطرها,
    
    -- جنسیت
    COUNT([F2_D04]) AS غیر_null_جنسیت,
    COUNT(*) - COUNT([F2_D04]) AS null_جنسیت,
    
    -- سن (اسم ستون را بگو)
    COUNT([F2_D07]) AS غیر_null_سن,
    COUNT(*) - COUNT([F2_D07]) AS null_سن,
    
    -- تحصیلات (اسم ستون را بگو)
    COUNT([F2_D17]) AS غیر_null_تحصیلات,
    COUNT(*) - COUNT([F2_D17]) AS null_تحصیلات,
    
    -- وضعیت تاهل (اسم ستون را بگو)
    COUNT([F2_D05]) AS غیر_null_تاهل,
    COUNT(*) - COUNT([F2_D05]) AS null_تاهل,
    
    -- وضعیت اشتغال (اسم ستون را بگو)
    COUNT([F2_D15]) AS غیر_null_اشتغال,
    COUNT(*) - COUNT([F2_D15]) AS null_اشتغال

FROM dbo.[labour_force_all];
