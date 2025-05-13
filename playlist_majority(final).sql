CREATE MATERIALIZED VIEW IF NOT EXISTS playlist_majority
AS
SELECT pgr.playlist_id, pgr.name
FROM playlist_genre_ratios as pgr
JOIN playlist_majority_genre as pmg
	ON pmg.minratio = pgr.ratio
	AND pmg.playlist_id = pgr.playlist_id
WITH DATA;