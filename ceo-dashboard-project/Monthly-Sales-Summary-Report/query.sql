SELECT 
    '1399' AS year,
    CASE
        WHEN sales_invoice.RUN_DATE > 132291360000000000   AND sales_invoice.RUN_DATE <= 132317280000000000    + 24 * 60 * 60 * 10000000 THEN 'فروردین'
        WHEN sales_invoice.RUN_DATE > 132318144000000000   AND sales_invoice.RUN_DATE <= 132344064000000000   + 24 * 60 * 60 * 10000000 THEN 'اردیبهشت'
        WHEN sales_invoice.RUN_DATE > 132344928000000000   AND sales_invoice.RUN_DATE <= 132370848000000000   + 24 * 60 * 60 * 10000000 THEN 'خرداد'
        WHEN sales_invoice.RUN_DATE > 132371712000000000   AND sales_invoice.RUN_DATE <= 132397632000000000   + 24 * 60 * 60 * 10000000 THEN 'تیر'
        WHEN sales_invoice.RUN_DATE > 132398496000000000   AND sales_invoice.RUN_DATE <= 132424416000000000  + 24 * 60 * 60 * 10000000 THEN 'مرداد'
        WHEN sales_invoice.RUN_DATE > 132425280000000000   AND sales_invoice.RUN_DATE <= 132451200000000000   + 24 * 60 * 60 * 10000000 THEN 'شهریور'
        WHEN sales_invoice.RUN_DATE > 132452064000000000   AND sales_invoice.RUN_DATE <= 132477120000000000   + 24 * 60 * 60 * 10000000 THEN 'مهر'
        WHEN sales_invoice.RUN_DATE > 132477984000000000   AND sales_invoice.RUN_DATE <= 132503040000000000   + 24 * 60 * 60 * 10000000 THEN 'آبان'
        WHEN sales_invoice.RUN_DATE > 132503904000000000   AND sales_invoice.RUN_DATE <= 132528960000000000   + 24 * 60 * 60 * 10000000 THEN 'آذر'
        WHEN sales_invoice.RUN_DATE > 132529824000000000   AND sales_invoice.RUN_DATE <= 132554880000000000   + 24 * 60 * 60 * 10000000 THEN 'دی'
        WHEN sales_invoice.RUN_DATE > 132555744000000000   AND sales_invoice.RUN_DATE <= 132580800000000000   + 24 * 60 * 60 * 10000000 THEN 'بهمن'
        WHEN sales_invoice.RUN_DATE > 132581664000000000   AND sales_invoice.RUN_DATE <= 132606720000000000  + 24 * 60 * 60 * 10000000 THEN 'اسفند'
    END AS month,
    SUM(
        (
            (
                (
                    sales_invoice_product.BASE_SYMBOL_FEE * 
                    (
                        COALESCE(sales_invoice_product.QUANTITY, 0) /
                        POWER(10, COALESCE(WH_STOCK_CAPACITY.DECIMAL_NUM, 0))
                    )
                ) / POWER(10, 3)
            ) + sales_invoice_product.BASE_SYMBOL_TAX + sales_invoice_product.BASE_SYMBOL_TOLL +
            sales_invoice_product.BASE_SYM_VALUE_ADDED - sales_invoice_product.BASE_SYMBOL_DISCOUNT
        )
    ) AS total_amount
FROM
    sales_invoice
left JOIN sales_invoice_product ON sales_invoice.id = sales_invoice_product.INVOICE_ID
left JOIN pa_client ON pa_client.ID = sales_invoice.client_id
left JOIN pa_center ON pa_center.ID = sales_invoice.SALES_CENTER
left JOIN pa_client AS AmelFroush ON AmelFroush.ID = sales_invoice.sales_agent
left JOIN WH_PRODUCT ON WH_PRODUCT.id = sales_invoice_product.PRODUCT_ID
left JOIN WH_STOCK_CAPACITY ON WH_STOCK_CAPACITY.id = WH_PRODUCT.capacity_id
left JOIN sales_center_setting AS scs ON pa_center.id = scs.CENTER_ID

 WHERE
    sales_invoice.RUN_DATE >= 132291360000000000 AND sales_invoice.RUN_DATE <= 132606720000000000 + 24 * 60 * 60 * 10000000
    AND sales_invoice.type = 1
    AND sales_invoice.org_id = 2
    AND sales_invoice.DELETED = 0
    AND WH_PRODUCT.product_type_id = 4
    AND WH_PRODUCT.full_code NOT IN (9601, 9602, 9603, 9604, 9605, 9205, 99, 9606)
GROUP BY
    year, month
UNION
SELECT 
    '1400' AS year,
    CASE
        WHEN sales_invoice.RUN_DATE > 132607584000000000   AND sales_invoice.RUN_DATE <= 132633504000000000 + 24 * 60 * 60 * 10000000 THEN 'فروردین'
        WHEN sales_invoice.RUN_DATE > 132634368000000000   AND sales_invoice.RUN_DATE <= 132660288000000000 + 24 * 60 * 60 * 10000000 THEN 'اردیبهشت'
        WHEN sales_invoice.RUN_DATE > 132661152000000000   AND sales_invoice.RUN_DATE <= 132687072000000000 + 24 * 60 * 60 * 10000000 THEN 'خرداد'
        WHEN sales_invoice.RUN_DATE > 132687936000000000   AND sales_invoice.RUN_DATE <= 132713856000000000 + 24 * 60 * 60 * 10000000 THEN 'تیر'
        WHEN sales_invoice.RUN_DATE > 132714720000000000   AND sales_invoice.RUN_DATE <= 132740640000000000 + 24 * 60 * 60 * 10000000 THEN 'مرداد'
        WHEN sales_invoice.RUN_DATE > 132741504000000000   AND sales_invoice.RUN_DATE <= 132767424000000000 + 24 * 60 * 60 * 10000000 THEN 'شهریور'
        WHEN sales_invoice.RUN_DATE > 132768288000000000   AND sales_invoice.RUN_DATE <= 132793344000000000 + 24 * 60 * 60 * 10000000 THEN 'مهر'
        WHEN sales_invoice.RUN_DATE > 132794208000000000   AND sales_invoice.RUN_DATE <= 132819264000000000 + 24 * 60 * 60 * 10000000 THEN 'آبان'
        WHEN sales_invoice.RUN_DATE > 132820128000000000   AND sales_invoice.RUN_DATE <= 132845184000000000 + 24 * 60 * 60 * 10000000 THEN 'آذر'
        WHEN sales_invoice.RUN_DATE > 132846048000000000   AND sales_invoice.RUN_DATE <= 132871104000000000 + 24 * 60 * 60 * 10000000 THEN 'دی'
        WHEN sales_invoice.RUN_DATE > 132871968000000000   AND sales_invoice.RUN_DATE <= 132897024000000000 + 24 * 60 * 60 * 10000000 THEN 'بهمن'
        WHEN sales_invoice.RUN_DATE > 132897888000000000   AND sales_invoice.RUN_DATE <= 132922080000000000 + 24 * 60 * 60 * 10000000 THEN 'اسفند'
    END AS month,
    SUM(
        (
            (
                (
                    sales_invoice_product.BASE_SYMBOL_FEE *
                    (
                        COALESCE(sales_invoice_product.QUANTITY, 0) /
                        POWER(10, COALESCE(WH_STOCK_CAPACITY.DECIMAL_NUM, 0))
                    )
                ) / POWER(10, 3)
            ) + sales_invoice_product.BASE_SYMBOL_TAX + sales_invoice_product.BASE_SYMBOL_TOLL +
            sales_invoice_product.BASE_SYM_VALUE_ADDED - sales_invoice_product.BASE_SYMBOL_DISCOUNT
        )
    ) AS total_amount
FROM
    sales_invoice
left JOIN sales_invoice_product ON sales_invoice.id = sales_invoice_product.INVOICE_ID
left JOIN pa_client ON pa_client.ID = sales_invoice.client_id
left JOIN pa_center ON pa_center.ID = sales_invoice.SALES_CENTER
left JOIN pa_client AS AmelFroush ON AmelFroush.ID = sales_invoice.sales_agent
left JOIN WH_PRODUCT ON WH_PRODUCT.id = sales_invoice_product.PRODUCT_ID
left JOIN WH_STOCK_CAPACITY ON WH_STOCK_CAPACITY.id = WH_PRODUCT.capacity_id
left JOIN sales_center_setting AS scs ON pa_center.id = scs.CENTER_ID

  WHERE
    sales_invoice.RUN_DATE >= 132607584000000000  AND sales_invoice.RUN_DATE <= 132922080000000000+ 24 * 60 * 60 * 10000000
    AND sales_invoice.type = 1
    AND sales_invoice.org_id = 2
    AND sales_invoice.DELETED = 0
    AND WH_PRODUCT.product_type_id = 4
    AND WH_PRODUCT.full_code NOT IN (9601, 9602, 9603, 9604, 9605, 9205, 99, 9606)
GROUP BY
    year, month

UNION

SELECT 
    '1401' AS year,
    CASE
        WHEN sales_invoice.RUN_DATE > 132922944000000000  AND sales_invoice.RUN_DATE <= 132948864000000000  + 24 * 60 * 60 * 10000000 THEN 'فروردین'
        WHEN sales_invoice.RUN_DATE > 132949728000000000  AND sales_invoice.RUN_DATE <= 132975648000000000  + 24 * 60 * 60 * 10000000 THEN 'اردیبهشت'
        WHEN sales_invoice.RUN_DATE > 132976512000000000  AND sales_invoice.RUN_DATE <= 133002432000000000  + 24 * 60 * 60 * 10000000 THEN 'خرداد'
        WHEN sales_invoice.RUN_DATE > 133003296000000000  AND sales_invoice.RUN_DATE <= 133029216000000000  + 24 * 60 * 60 * 10000000 THEN 'تیر'
        WHEN sales_invoice.RUN_DATE > 133030080000000000  AND sales_invoice.RUN_DATE <= 133056000000000000  + 24 * 60 * 60 * 10000000 THEN 'مرداد'
        WHEN sales_invoice.RUN_DATE > 133056864000000000  AND sales_invoice.RUN_DATE <= 133082784000000000  + 24 * 60 * 60 * 10000000 THEN 'شهریور'
        WHEN sales_invoice.RUN_DATE > 133083648000000000  AND sales_invoice.RUN_DATE <= 133108704000000000  + 24 * 60 * 60 * 10000000 THEN 'مهر'
        WHEN sales_invoice.RUN_DATE > 133083648000000000  AND sales_invoice.RUN_DATE <= 133134624000000000  + 24 * 60 * 60 * 10000000 THEN 'آبان'
        WHEN sales_invoice.RUN_DATE > 133135488000000000  AND sales_invoice.RUN_DATE <= 133160544000000000  + 24 * 60 * 60 * 10000000 THEN 'آذر'
        WHEN sales_invoice.RUN_DATE > 133161408000000000  AND sales_invoice.RUN_DATE <= 133186464000000000  + 24 * 60 * 60 * 10000000 THEN 'دی'
        WHEN sales_invoice.RUN_DATE > 133187328000000000  AND sales_invoice.RUN_DATE <= 133212384000000000  + 24 * 60 * 60 * 10000000 THEN 'بهمن'
        WHEN sales_invoice.RUN_DATE > 133213248000000000  AND sales_invoice.RUN_DATE <= 133237440000000000  + 24 * 60 * 60 * 10000000 THEN 'اسفند'
    END AS month,
    SUM(
        (
            (
                (
                    sales_invoice_product.BASE_SYMBOL_FEE *
                    (
                        COALESCE(sales_invoice_product.QUANTITY, 0) /
                        POWER(10, COALESCE(WH_STOCK_CAPACITY.DECIMAL_NUM, 0))
                    )
                ) / POWER(10, 3)
            ) + sales_invoice_product.BASE_SYMBOL_TAX + sales_invoice_product.BASE_SYMBOL_TOLL +
            sales_invoice_product.BASE_SYM_VALUE_ADDED - sales_invoice_product.BASE_SYMBOL_DISCOUNT
        )
    ) AS total_amount
FROM
    sales_invoice
left JOIN sales_invoice_product ON sales_invoice.id = sales_invoice_product.INVOICE_ID
left JOIN pa_client ON pa_client.ID = sales_invoice.client_id
left JOIN pa_center ON pa_center.ID = sales_invoice.SALES_CENTER
left JOIN pa_client AS AmelFroush ON AmelFroush.ID = sales_invoice.sales_agent
left JOIN WH_PRODUCT ON WH_PRODUCT.id = sales_invoice_product.PRODUCT_ID
left JOIN WH_STOCK_CAPACITY ON WH_STOCK_CAPACITY.id = WH_PRODUCT.capacity_id
left JOIN sales_center_setting AS scs ON pa_center.id = scs.CENTER_ID

  WHERE
    sales_invoice.RUN_DATE >= 132922944000000000 AND sales_invoice.RUN_DATE <= 133237440000000000 + 24 * 60 * 60 * 10000000
    AND sales_invoice.type = 1
    AND sales_invoice.org_id = 2
    AND sales_invoice.DELETED = 0
    AND WH_PRODUCT.product_type_id = 4
    AND WH_PRODUCT.full_code NOT IN (9601, 9602, 9603, 9604, 9605, 9205, 99, 9606)
GROUP BY
    year, month

UNION

SELECT 
    '1402' AS year,
    CASE
        WHEN sales_invoice.RUN_DATE > 133238304000000000  AND sales_invoice.RUN_DATE <= 133264224000000000  + 24 * 60 * 60 * 10000000 THEN 'فروردین'
        WHEN sales_invoice.RUN_DATE > 133265088000000000  AND sales_invoice.RUN_DATE <= 133291008000000000  + 24 * 60 * 60 * 10000000 THEN 'اردیبهشت'
        WHEN sales_invoice.RUN_DATE > 133291872000000000  AND sales_invoice.RUN_DATE <= 133317792000000000  + 24 * 60 * 60 * 10000000 THEN 'خرداد'
        WHEN sales_invoice.RUN_DATE > 133318656000000000  AND sales_invoice.RUN_DATE <= 133344576000000000  + 24 * 60 * 60 * 10000000 THEN 'تیر'
        WHEN sales_invoice.RUN_DATE > 133345440000000000  AND sales_invoice.RUN_DATE <= 133371360000000000  + 24 * 60 * 60 * 10000000 THEN 'مرداد'
        WHEN sales_invoice.RUN_DATE > 133372224000000000  AND sales_invoice.RUN_DATE <= 133398144000000000  + 24 * 60 * 60 * 10000000 THEN 'شهریور'
        WHEN sales_invoice.RUN_DATE > 133399008000000000  AND sales_invoice.RUN_DATE <= 133424064000000000  + 24 * 60 * 60 * 10000000 THEN 'مهر'
        WHEN sales_invoice.RUN_DATE > 133424928000000000  AND sales_invoice.RUN_DATE <= 133449984000000000  + 24 * 60 * 60 * 10000000 THEN 'آبان'
        WHEN sales_invoice.RUN_DATE > 133450848000000000  AND sales_invoice.RUN_DATE <= 133475904000000000  + 24 * 60 * 60 * 10000000 THEN 'آذر'
        WHEN sales_invoice.RUN_DATE > 133476768000000000  AND sales_invoice.RUN_DATE <= 133501824000000000   + 24 * 60 * 60 * 10000000 THEN 'دی'
        WHEN sales_invoice.RUN_DATE > 133502688000000000  AND sales_invoice.RUN_DATE <= 133527744000000000  + 24 * 60 * 60 * 10000000 THEN 'بهمن'
        WHEN sales_invoice.RUN_DATE > 133528608000000000   AND sales_invoice.RUN_DATE <= 133552800000000000   + 24 * 60 * 60 * 10000000 THEN 'اسفند'
    END AS month,
    SUM(
        (
            (
                (
                    sales_invoice_product.BASE_SYMBOL_FEE *
                    (
                        COALESCE(sales_invoice_product.QUANTITY, 0) /
                        POWER(10, COALESCE(WH_STOCK_CAPACITY.DECIMAL_NUM, 0))
                    )
                ) / POWER(10, 3)
            ) + sales_invoice_product.BASE_SYMBOL_TAX + sales_invoice_product.BASE_SYMBOL_TOLL +
            sales_invoice_product.BASE_SYM_VALUE_ADDED - sales_invoice_product.BASE_SYMBOL_DISCOUNT
        )
    ) AS total_amount
FROM
    sales_invoice
left JOIN sales_invoice_product ON sales_invoice.id = sales_invoice_product.INVOICE_ID
left JOIN pa_client ON pa_client.ID = sales_invoice.client_id
left JOIN pa_center ON pa_center.ID = sales_invoice.SALES_CENTER
left JOIN pa_client AS AmelFroush ON AmelFroush.ID = sales_invoice.sales_agent
left JOIN WH_PRODUCT ON WH_PRODUCT.id = sales_invoice_product.PRODUCT_ID
left JOIN WH_STOCK_CAPACITY ON WH_STOCK_CAPACITY.id = WH_PRODUCT.capacity_id
left JOIN sales_center_setting AS scs ON pa_center.id = scs.CENTER_ID

  WHERE
    sales_invoice.RUN_DATE >= 133238304000000000 AND sales_invoice.RUN_DATE <= 133552800000000000 + 24 * 60 * 60 * 10000000
    AND sales_invoice.type = 1
    AND sales_invoice.org_id = 2
    AND sales_invoice.DELETED = 0
    AND WH_PRODUCT.product_type_id = 4
    AND WH_PRODUCT.full_code NOT IN (9601, 9602, 9603, 9604, 9605, 9205, 99, 9606)
GROUP BY
    year, month

UNION

SELECT 
    '1403' AS year,
    CASE
        WHEN sales_invoice.RUN_DATE > 133553664000000000  AND sales_invoice.RUN_DATE <= 133579584000000000   + 24 * 60 * 60 * 10000000 THEN 'فروردین'
        WHEN sales_invoice.RUN_DATE > 133580448000000000 AND sales_invoice.RUN_DATE <= 133606368000000000  + 24 * 60 * 60 * 10000000 THEN 'اردیبهشت'
        WHEN sales_invoice.RUN_DATE > 133607232000000000  AND sales_invoice.RUN_DATE <= 133633152000000000  + 24 * 60 * 60 * 10000000 THEN 'خرداد'
        WHEN sales_invoice.RUN_DATE > 133634016000000000  AND sales_invoice.RUN_DATE <= 133659936000000000  + 24 * 60 * 60 * 10000000 THEN 'تیر'
        WHEN sales_invoice.RUN_DATE > 133660800000000000  AND sales_invoice.RUN_DATE <= 133686720000000000  + 24 * 60 * 60 * 10000000 THEN 'مرداد'
        WHEN sales_invoice.RUN_DATE > 133687584000000000  AND sales_invoice.RUN_DATE <= 133713504000000000  + 24 * 60 * 60 * 10000000 THEN 'شهریور'
        WHEN sales_invoice.RUN_DATE > 133714368000000000  AND sales_invoice.RUN_DATE <= 133739424000000000  + 24 * 60 * 60 * 10000000 THEN 'مهر'
        WHEN sales_invoice.RUN_DATE > 133740288000000000  AND sales_invoice.RUN_DATE <= 133765344000000000  + 24 * 60 * 60 * 10000000 THEN 'آبان'
        WHEN sales_invoice.RUN_DATE > 133766208000000000  AND sales_invoice.RUN_DATE <= 133791264000000000  + 24 * 60 * 60 * 10000000 THEN 'آذر'
        WHEN sales_invoice.RUN_DATE > 133792128000000000  AND sales_invoice.RUN_DATE <= 133817184000000000  + 24 * 60 * 60 * 10000000 THEN 'دی'
        WHEN sales_invoice.RUN_DATE > 133818048000000000  AND sales_invoice.RUN_DATE <= 133843104000000000  + 24 * 60 * 60 * 10000000 THEN 'بهمن'
        WHEN sales_invoice.RUN_DATE > 133843968000000000  AND sales_invoice.RUN_DATE <= 133869024000000000   + 24 * 60 * 60 * 10000000 THEN 'اسفند'
    END AS month,
    SUM(
        (
            (
                (
                    sales_invoice_product.BASE_SYMBOL_FEE *
                    (
                        COALESCE(sales_invoice_product.QUANTITY, 0) /
                        POWER(10, COALESCE(WH_STOCK_CAPACITY.DECIMAL_NUM, 0))
                    )
                ) / POWER(10, 3)
            ) + sales_invoice_product.BASE_SYMBOL_TAX + sales_invoice_product.BASE_SYMBOL_TOLL +
            sales_invoice_product.BASE_SYM_VALUE_ADDED - sales_invoice_product.BASE_SYMBOL_DISCOUNT
        )
    ) AS total_amount
FROM
    sales_invoice
left JOIN sales_invoice_product ON sales_invoice.id = sales_invoice_product.INVOICE_ID
left JOIN pa_client ON pa_client.ID = sales_invoice.client_id
left JOIN pa_center ON pa_center.ID = sales_invoice.SALES_CENTER
left JOIN pa_client AS AmelFroush ON AmelFroush.ID = sales_invoice.sales_agent
left JOIN WH_PRODUCT ON WH_PRODUCT.id = sales_invoice_product.PRODUCT_ID
left JOIN WH_STOCK_CAPACITY ON WH_STOCK_CAPACITY.id = WH_PRODUCT.capacity_id
left JOIN sales_center_setting AS scs ON pa_center.id = scs.CENTER_ID
  
 WHERE
    sales_invoice.RUN_DATE >= 133553664000000000  AND sales_invoice.RUN_DATE <= 133869024000000000  + 24 * 60 * 60 * 10000000
    AND sales_invoice.type = 1
    AND sales_invoice.org_id = 2
    AND sales_invoice.DELETED = 0
    AND WH_PRODUCT.product_type_id = 4
    AND WH_PRODUCT.full_code NOT IN (9601, 9602, 9603, 9604, 9605, 9205, 99, 9606)
GROUP BY
    year, month
  
 
  
   UNION

SELECT 
    '1404' AS year,
    CASE
        WHEN sales_invoice.RUN_DATE > 133869888000000000   AND sales_invoice.RUN_DATE <= 133895808000000000     + 24 * 60 * 60 * 10000000 THEN 'فروردین'
        WHEN sales_invoice.RUN_DATE > 133896672000000000   AND sales_invoice.RUN_DATE <= 133922592000000000   + 24 * 60 * 60 * 10000000 THEN 'اردیبهشت'
        WHEN sales_invoice.RUN_DATE > 133923456000000000   AND sales_invoice.RUN_DATE <= 133949376000000000   + 24 * 60 * 60 * 10000000 THEN 'خرداد'
        WHEN sales_invoice.RUN_DATE > 133950240000000000   AND sales_invoice.RUN_DATE <= 133976160000000000   + 24 * 60 * 60 * 10000000 THEN 'تیر'
        WHEN sales_invoice.RUN_DATE > 133977024000000000   AND sales_invoice.RUN_DATE <= 134002944000000000   + 24 * 60 * 60 * 10000000 THEN 'مرداد'
        WHEN sales_invoice.RUN_DATE > 134003808000000000   AND sales_invoice.RUN_DATE <= 134029728000000000   + 24 * 60 * 60 * 10000000 THEN 'شهریور'
        WHEN sales_invoice.RUN_DATE > 134030592000000000   AND sales_invoice.RUN_DATE <= 134055648000000000   + 24 * 60 * 60 * 10000000 THEN 'مهر'
        WHEN sales_invoice.RUN_DATE > 134056512000000000   AND sales_invoice.RUN_DATE <= 134081568000000000   + 24 * 60 * 60 * 10000000 THEN 'آبان'
        WHEN sales_invoice.RUN_DATE > 134082432000000000   AND sales_invoice.RUN_DATE <= 134107488000000000   + 24 * 60 * 60 * 10000000 THEN 'آذر'
        WHEN sales_invoice.RUN_DATE > 134108352000000000   AND sales_invoice.RUN_DATE <= 134133408000000000   + 24 * 60 * 60 * 10000000 THEN 'دی'
        WHEN sales_invoice.RUN_DATE > 134134272000000000   AND sales_invoice.RUN_DATE <= 134159328000000000   + 24 * 60 * 60 * 10000000 THEN 'بهمن'
        WHEN sales_invoice.RUN_DATE > 134160192000000000   AND sales_invoice.RUN_DATE <= 134184384000000000    + 24 * 60 * 60 * 10000000 THEN 'اسفند'
    END AS month,
    SUM(
        (
            (
                (
                    sales_invoice_product.BASE_SYMBOL_FEE *
                    (
                        COALESCE(sales_invoice_product.QUANTITY, 0) /
                        POWER(10, COALESCE(WH_STOCK_CAPACITY.DECIMAL_NUM, 0))
                    )
                ) / POWER(10, 3)
            ) + sales_invoice_product.BASE_SYMBOL_TAX + sales_invoice_product.BASE_SYMBOL_TOLL +
            sales_invoice_product.BASE_SYM_VALUE_ADDED - sales_invoice_product.BASE_SYMBOL_DISCOUNT
        )
    ) AS total_amount
FROM
    sales_invoice
left JOIN sales_invoice_product ON sales_invoice.id = sales_invoice_product.INVOICE_ID
left JOIN pa_client ON pa_client.ID = sales_invoice.client_id
left JOIN pa_center ON pa_center.ID = sales_invoice.SALES_CENTER
left JOIN pa_client AS AmelFroush ON AmelFroush.ID = sales_invoice.sales_agent
left JOIN WH_PRODUCT ON WH_PRODUCT.id = sales_invoice_product.PRODUCT_ID
left JOIN WH_STOCK_CAPACITY ON WH_STOCK_CAPACITY.id = WH_PRODUCT.capacity_id
left JOIN sales_center_setting AS scs ON pa_center.id = scs.CENTER_ID
  
 WHERE
    sales_invoice.RUN_DATE >= 133869888000000000  AND sales_invoice.RUN_DATE <= 134184384000000000  + 24 * 60 * 60 * 10000000
    AND sales_invoice.type = 1
    AND sales_invoice.org_id = 2
    AND sales_invoice.DELETED = 0
    AND WH_PRODUCT.product_type_id = 4
    AND WH_PRODUCT.full_code NOT IN (9601, 9602, 9603, 9604, 9605, 9205, 99, 9606)
GROUP BY
    year, month;