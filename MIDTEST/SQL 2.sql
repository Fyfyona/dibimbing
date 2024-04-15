SELECT item
FROM (
    SELECT item, ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num
    FROM item_bought
    GROUP BY item) AS temp
WHERE row_num = (SELECT (COUNT(*) + 6) / 6 FROM item_bought
                );