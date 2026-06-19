
-- Get 10-micron configurations --------------------
DECLARE @radius INT = 20; -- 0.5 microns / pixel

-- Tumour only -------------------------------------
drop table if exists dbo.wsi01_TumorConfigs_10;

WITH randtable AS (
	SELECT n.*
	FROM wsi01.dbo.neighborsdr n
	JOIN wsi01.dbo.randomcell r
		ON (n.sampleid = r.sampleid AND n.c2 = r.cellid)
	WHERE n.dist <= @radius
	AND r.tdist <= 0
	),
counts_per_cell AS (
	SELECT
		sampleid,
		c2,
		COUNT(CASE WHEN ptype1 = 0 THEN 1 END) AS Other,
		COUNT(CASE WHEN ptype1 = 1 THEN 1 END) AS CD8,
		COUNT(CASE WHEN ptype1 = 2 THEN 1 END) AS FoxP3,
		COUNT(CASE WHEN ptype1 = 3 THEN 1 END) AS Tumor,
		COUNT(CASE WHEN ptype1 = 4 THEN 1 END) AS CD68,
		COUNT(CASE WHEN ptype1 = 5 THEN 1 END) AS CD8FoxP3
	FROM randtable
	GROUP BY sampleid, c2
	)

SELECT
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3,
	COUNT(*) AS Total_Count
INTO dbo.wsi01_TumorConfigs_10
FROM counts_per_cell
GROUP BY
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3
ORDER BY sampleid, Total_Count DESC
----------------------------------------------------
-- Background Lung only ----------------------------
drop table if exists dbo.wsi01_BackgroundConfigs_10;

WITH randtable AS (
	SELECT n.*
	FROM wsi01.dbo.neighborsdr n
	JOIN wsi01.dbo.randomcell r
		ON (n.sampleid = r.sampleid AND n.c2 = r.cellid)
	WHERE n.dist <= @radius
	AND r.tdist > 0
	),
counts_per_cell AS (
	SELECT
		sampleid,
		c2,
		COUNT(CASE WHEN ptype1 = 0 THEN 1 END) AS Other,
		COUNT(CASE WHEN ptype1 = 1 THEN 1 END) AS CD8,
		COUNT(CASE WHEN ptype1 = 2 THEN 1 END) AS FoxP3,
		COUNT(CASE WHEN ptype1 = 3 THEN 1 END) AS Tumor,
		COUNT(CASE WHEN ptype1 = 4 THEN 1 END) AS CD68,
		COUNT(CASE WHEN ptype1 = 5 THEN 1 END) AS CD8FoxP3
	FROM randtable
	GROUP BY sampleid, c2
	)

SELECT
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3,
	COUNT(*) AS Total_Count
INTO dbo.wsi01_BackgroundConfigs_10
FROM counts_per_cell
GROUP BY
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3
ORDER BY sampleid, Total_Count DESC
----------------------------------------------------
----------------------------------------------------


-- Get 17.5-micron configurations ------------------
DECLARE @radius INT = 35;

-- Tumour only -------------------------------------
IF OBJECT_ID('dbo.wsi01_TumorConfigs_175') IS NOT NULL
	DROP TABLE dbo.wsi01_TumorConfigs_175;

WITH randtable AS (
	SELECT n.*
	FROM wsi01.dbo.neighborsdr n
	JOIN wsi01.dbo.randomcell r
		ON (n.sampleid = r.sampleid AND n.c2 = r.cellid)
	WHERE n.dist <= @radius
	AND r.tdist <= 0
	),
counts_per_cell AS (
	SELECT
		sampleid,
		c2,
		COUNT(CASE WHEN ptype1 = 0 THEN 1 END) AS Other,
		COUNT(CASE WHEN ptype1 = 1 THEN 1 END) AS CD8,
		COUNT(CASE WHEN ptype1 = 2 THEN 1 END) AS FoxP3,
		COUNT(CASE WHEN ptype1 = 3 THEN 1 END) AS Tumor,
		COUNT(CASE WHEN ptype1 = 4 THEN 1 END) AS CD68,
		COUNT(CASE WHEN ptype1 = 5 THEN 1 END) AS CD8FoxP3
	FROM randtable
	GROUP BY sampleid, c2
	)

SELECT
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3,
	COUNT(*) AS Total_Count
INTO dbo.wsi01_TumorConfigs_175
FROM counts_per_cell
GROUP BY
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3
ORDER BY sampleid, Total_Count DESC
----------------------------------------------------
-- Background Lung only ----------------------------
drop table if exists dbo.wsi01_BackgroundConfigs_175;

WITH randtable AS (
	SELECT n.*
	FROM wsi01.dbo.neighborsdr n
	JOIN wsi01.dbo.randomcell r
		ON (n.sampleid = r.sampleid AND n.c2 = r.cellid)
	WHERE n.dist <= @radius
	AND r.tdist > 0
	),
counts_per_cell AS (
	SELECT
		sampleid,
		c2,
		COUNT(CASE WHEN ptype1 = 0 THEN 1 END) AS Other,
		COUNT(CASE WHEN ptype1 = 1 THEN 1 END) AS CD8,
		COUNT(CASE WHEN ptype1 = 2 THEN 1 END) AS FoxP3,
		COUNT(CASE WHEN ptype1 = 3 THEN 1 END) AS Tumor,
		COUNT(CASE WHEN ptype1 = 4 THEN 1 END) AS CD68,
		COUNT(CASE WHEN ptype1 = 5 THEN 1 END) AS CD8FoxP3
	FROM randtable
	GROUP BY sampleid, c2
	)

SELECT
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3,
	COUNT(*) AS Total_Count
INTO dbo.wsi01_BackgroundConfigs_175
FROM counts_per_cell
GROUP BY
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3
ORDER BY sampleid, Total_Count DESC
----------------------------------------------------
----------------------------------------------------


-- Get 25-micron configurations --------------------
DECLARE @radius INT = 50;

-- Tumour only -------------------------------------
drop table if exists dbo.wsi01_TumorConfigs_25;

WITH randtable AS (
	SELECT n.*
	FROM wsi01.dbo.neighborsdr n
	JOIN wsi01.dbo.randomcell r
		ON (n.sampleid = r.sampleid AND n.c2 = r.cellid)
	WHERE n.dist <= @radius
	AND r.tdist <= 0
	),
counts_per_cell AS (
	SELECT
		sampleid,
		c2,
		COUNT(CASE WHEN ptype1 = 0 THEN 1 END) AS Other,
		COUNT(CASE WHEN ptype1 = 1 THEN 1 END) AS CD8,
		COUNT(CASE WHEN ptype1 = 2 THEN 1 END) AS FoxP3,
		COUNT(CASE WHEN ptype1 = 3 THEN 1 END) AS Tumor,
		COUNT(CASE WHEN ptype1 = 4 THEN 1 END) AS CD68,
		COUNT(CASE WHEN ptype1 = 5 THEN 1 END) AS CD8FoxP3
	FROM randtable
	GROUP BY sampleid, c2
	)

SELECT
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3,
	COUNT(*) AS Total_Count
INTO dbo.wsi01_TumorConfigs_25
FROM counts_per_cell
GROUP BY
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3
ORDER BY sampleid, Total_Count DESC
----------------------------------------------------
-- Background Lung only ----------------------------
drop table if exists dbo.wsi01_BackgroundConfigs_25;

WITH randtable AS (
	SELECT n.*
	FROM wsi01.dbo.neighborsdr n
	JOIN wsi01.dbo.randomcell r
		ON (n.sampleid = r.sampleid AND n.c2 = r.cellid)
	WHERE n.dist <= @radius
	AND r.tdist > 0
	),
counts_per_cell AS (
	SELECT
		sampleid,
		c2,
		COUNT(CASE WHEN ptype1 = 0 THEN 1 END) AS Other,
		COUNT(CASE WHEN ptype1 = 1 THEN 1 END) AS CD8,
		COUNT(CASE WHEN ptype1 = 2 THEN 1 END) AS FoxP3,
		COUNT(CASE WHEN ptype1 = 3 THEN 1 END) AS Tumor,
		COUNT(CASE WHEN ptype1 = 4 THEN 1 END) AS CD68,
		COUNT(CASE WHEN ptype1 = 5 THEN 1 END) AS CD8FoxP3
	FROM randtable
	GROUP BY sampleid, c2
	)

SELECT
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3,
	COUNT(*) AS Total_Count
INTO dbo.wsi01_BackgroundConfigs_25
FROM counts_per_cell
GROUP BY
	sampleid,
	Other,
	CD8,
	FoxP3,
	Tumor,
	CD68,
	CD8FoxP3
ORDER BY sampleid, Total_Count DESC
----------------------------------------------------

----------------------------------------------------
----------------------------------------------------