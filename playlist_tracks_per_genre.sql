CREATE MATERIALIZED VIEW IF NOT EXISTS playlist_tracks_per_genre
	AS	
SELECT pt.playlist_id, COALESCE(g.name,'Total') AS name, COUNT(DISTINCT t.track_id) as count
FROM playlist_only_music AS pom
	JOIN playlist_track AS pt ON pom.playlist_id = pom.playlist_id
	JOIN track AS t ON pt.track_id = t.track_id
	JOIN genre AS g ON g.genre_id = t.genre_id
GROUP BY ROLLUP (pt.playlist_id, g.name)
	ORDER BY playlist_id, count
WITH DATA;