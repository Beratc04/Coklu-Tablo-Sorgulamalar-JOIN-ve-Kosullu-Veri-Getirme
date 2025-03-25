--SORU 1 USA'deki 2009 Yılı Faturalarının Toplamı

SELECT SUM(total) AS total_usa_2009
FROM invoice
WHERE billing_country = 'USA'
  AND invoice_date BETWEEN '2009-01-01' AND '2009-12-31';

--SORU 2 Tüm Parça Bilgilerini Playlist Bilgileriyle Birleştirme

SELECT 
    t.track_id,
    t.name AS track_name,
    t.composer,
    t.milliseconds,
    pt.playlist_id,
    p.name AS playlist_name
FROM 
    track t
LEFT JOIN 
    playlisttrack pt ON t.track_id = pt.track_id
LEFT JOIN 
    playlist p ON pt.playlist_id = p.playlist_id;

-- SORU 3 Belirli Bir Albüme Ait Parçaları Sanatçı Bilgisiyle Listeleme

SELECT 
    t.track_id,
    t.name AS track_name,
    t.milliseconds,
    a.name AS artist_name,
    al.title AS album_title
FROM 
    track t
JOIN 
    album al ON t.album_id = al.album_id
JOIN 
    artist a ON al.artist_id = a.artist_id
WHERE 
    al.title = 'Let There Be Rock'
ORDER BY 
    t.milliseconds DESC;
	