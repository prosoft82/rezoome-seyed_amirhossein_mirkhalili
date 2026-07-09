UPDATE dbo.[labour_force_all]
SET [F2_D04] = NULL
WHERE [F2_D04] = '' OR [F2_D04] = '--';

-- برای ستون سن
UPDATE dbo.[labour_force_all]
SET [F2_D07] = NULL
WHERE [F2_D07] = '' OR [F2_D07] = '--';