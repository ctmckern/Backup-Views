CREATE MATERIALIZED VIEW IF NOT EXISTS playlist_majority_genre
	AS
SELECT pgt.playlist_id, MIN(ratiopgt.ratio) as minratio FROM playlist_genre_totals AS pgt
		JOIN (SELECT playlist_id,name, grand_total/count as ratio 
		FROM playlist_genre_totals) AS ratiopgt ON pgt.playlist_id = ratiopgt.playlist_id
			AND pgt.name = ratiopgt.name
		GROUP BY pgt.playlist_id
		ORDER BY pgt.playlist_id
WITH DATA;