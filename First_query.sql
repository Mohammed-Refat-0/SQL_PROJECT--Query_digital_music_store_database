SELECT t1.Name,
       sum(t1.total_sales_of_track) AS total_genre_sales
FROM
  (SELECT InvoiceLine.TrackId AS Truck_id,
          InvoiceLine.UnitPrice AS unit_price,
          genre.Name,
          count(*) AS number_of_tracks_sold,
          (InvoiceLine.UnitPrice*count(*)) AS total_sales_of_track
   FROM InvoiceLine
   JOIN Track ON Track.TrackId=InvoiceLine.TrackId
   JOIN Genre ON genre.GenreId=Track.GenreId
   GROUP BY truck_id) t1
GROUP BY 1
ORDER BY 2 DESC
