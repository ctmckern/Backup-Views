CREATE MATERIALIZED VIEW IF NOT EXISTS playlist_only_music
	AS
SELECT * FROM playlist
WHERE playlist.name NOT LIKE 'Movies'
	AND playlist.name NOT LIKE 'TV Shows'
	AND playlist.name NOT LIKE 'Audiobooks'
WITH DATA;