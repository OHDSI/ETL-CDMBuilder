WITH  CTE_SUMMARY AS (
SELECT Patid, MIN(YRDOB) MIN_DOB, MAX(Yrdob) AS MAX_DOB, MIN(GDR_CD) AS MIN_SEX, MAX(GDR_CD) AS MAX_SEX 
  FROM MEMBER_DETAIL
  GROUP BY PATID 
) 

SELECT DISTINCT {0} 
	f.patid, f.patid
FROM MEMBER_DETAIL f
	JOIN (		/*find person's last record - handles tie breakers*/
		SELECT m2.patid, m2.eligeff, MAX(m2.eligend) AS eligend
		FROM MEMBER_DETAIL m2
			JOIN (
				SELECT m.patid, MAX(m.eligeff) AS eligeff
				FROM MEMBER_DETAIL m
				GROUP BY m.patid
			) m1
				ON m1.patid = m2.patid
				AND m1.eligeff = m2.eligeff
		GROUP BY  m2.patid, m2.eligeff
	) m3
		ON f.patid = m3.patid
		AND f.eligeff = m3.eligeff
		AND f.eligend = m3.eligend
	LEFT OUTER JOIN (
		SELECT m.PATID, MIN(YEAR(m.ELIGEFF)) AS MIN_ENROLL_YEAR
		FROM MEMBER_DETAIL m
		GROUP BY m.PATID
	) min_year
		ON min_year.PATID = f.PATID
WHERE f.YRDOB BETWEEN 1900 AND YEAR(GETDATE())
AND f.YRDOB <= (min_year.MIN_ENROLL_YEAR + 1) and f.patid not in
(
SELECT patid
FROM CTE_SUMMARY
WHERE MIN_DOB != 0 
AND ( 
       ABS(MIN_DOB-MAX_DOB) > 2 
       OR MIN_SEX != MAX_SEX 
) 
)
