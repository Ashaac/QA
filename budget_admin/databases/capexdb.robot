*** Settings ***

Library    DatabaseLibrary
Library     SeleniumLibrary
Library     String
Resource    ../api_keywords/commonApiKeywords.robot


*** Keywords ***


#    ${sql1}=   catenate    SELECT    (a.actual_value * a.budget_rate) AS budget_amt  FROM
#            ...     budgetdb.bd_budget a
#            ...    JOIN
#            ...   budgetdb.bd_budget_monthly b ON a.id = b.budget_id
#            ...        JOIN
#            ...    budgetdb.bd_account_category c ON a.account_category_id = c.id
#            ...     WHERE
#            ...    a.branch_id = 999 AND a.template_id = 3
#            ...    AND c.name = 'Land';
#
#    ${db_cpx_land}=      query     ${sql1}
#    ${a} =  set variable    ${db_cpx_land[0][0]}
#    ${bud}=  CONVERT TO INTEGER    ${a}
#    log to console    ${bud}
#    should be equal as strings    ${bud}    ${b}

Test cpx land db
    [Arguments]     ${b}

    ${land_db_month1}=  catenate    SELECT    mon_qa_1  FROM
            ...    (SELECT
            ...        x.account_category_id,
            ...            x.branch_id,
			...            x.cat_name,
			...            @month1:=((x.m1 + y.forcasted_year) - ((x.m1 + y.forcasted_year) * (dep / 100)) / 12) AS mon_qa_1,
			...            @month2:=((x.m2 + @month1) - ((x.m2 + @month1) * (dep / 100)) / 12) AS mon_qa_2,
			...            @month3:=((x.m3 + @month2) - ((x.m3 + @month2) * (dep / 100)) / 12) AS mon_qa_3,
			...            @month4:=((x.m4 + @month3) - ((x.m4 + @month3) * (dep / 100)) / 12) AS mon_qa_4,
			...            @month5:=((x.m5 + @month4) - ((x.m5 + @month4) * (dep / 100)) / 12) AS mon_qa_5,
			...            @month6:=((x.m6 + @month5) - ((x.m6 + @month5) * (dep / 100)) / 12) AS mon_qa_6,
			...            @month7:=((x.m7 + @month6) - ((x.m7 + @month6) * (dep / 100)) / 12) AS mon_qa_7,
			...            @month8:=((x.m8 + @month7) - ((x.m8 + @month7) * (dep / 100)) / 12) AS mon_qa_8,
			...            @month9:=((x.m9 + @month8) - ((x.m9 + @month8) * (dep / 100)) / 12) AS mon_qa_9,
			...            @month10:=((x.m10 + @month9) - ((x.m10 + @month9) * (dep / 100)) / 12) AS mon_qa_10,
			...            @month11:=((x.m11 + @month10) - ((x.m11 + @month10) * (dep / 100)) / 12) AS mon_qa_11,
			...            @month12:=((x.m12 + @month11) - ((x.m12 + @month11) * (dep / 100)) / 12) AS mon_qa_12,
			...            month_1,
			...            month_2,
			...            month_3,
			...            month_4,
			...            month_5,
			...            month_6,
			...            month_7,
			...            month_8,
			...            month_9,
			...            month_10,
			...            month_11,
			...            month_12,
			...            CASE
			...                WHEN ROUND(@month1, 0) = ROUND(month_1, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_1_status,
			...            CASE
			...                WHEN ROUND(@month2, 0) = ROUND(month_2, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_2_status,
			...            CASE
			...                WHEN ROUND(@month3, 0) = ROUND(month_3, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_3_status,
			...            CASE
			...                WHEN ROUND(@month4, 0) = ROUND(month_4, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_4_status,
			...            CASE
			...                WHEN ROUND(@month5, 0) = ROUND(month_5, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_5_status,
			...            CASE
			...                WHEN ROUND(@month6, 0) = ROUND(month_6, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_6_status,
			...            CASE
			...                WHEN ROUND(@month7, 0) = ROUND(month_7, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_7_status,
			...            CASE
			...                WHEN ROUND(@month8, 0) = ROUND(month_8, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_8_status,
			...            CASE
			...                WHEN ROUND(@month9, 0) = ROUND(month_9, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_9_status,
			...            CASE
			...                WHEN ROUND(@month10, 0) = ROUND(month_10, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_10_status,
			...            CASE
			...                WHEN ROUND(@month11, 0) = ROUND(month_11, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_11_status,
			...            CASE
			...                WHEN ROUND(@month12, 0) = ROUND(month_12, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_12_status
			...    FROM
			...        (SELECT
			...        de.depreciation_rate AS dep,
			...            de.account_category_id,
			...            branch_id,
			...            cat.name AS cat_name,
			...            SUM(m.month_1 * b.budget_rate) AS m1,
			...            SUM(m.month_2 * b.budget_rate) AS m2,
			...            SUM(m.month_3 * b.budget_rate) AS m3,
			...            SUM(m.month_4 * b.budget_rate) AS m4,
			...            SUM(m.month_5 * b.budget_rate) AS m5,
			...            SUM(m.month_6 * b.budget_rate) AS m6,
			...            SUM(m.month_7 * b.budget_rate) AS m7,
			...            SUM(m.month_8 * b.budget_rate) AS m8,
			...            SUM(m.month_9 * b.budget_rate) AS m9,
			...            SUM(m.month_10 * b.budget_rate) AS m10,
			...            SUM(m.month_11 * b.budget_rate) AS m11,
			...            SUM(m.month_12 * b.budget_rate) AS m12
			...    FROM
			...        budgetdb.bd_budget b
			...    INNER JOIN budgetdb.bd_account_category cat ON b.account_category_id = cat.id
			...    INNER JOIN budgetdb.bd_budget_monthly m ON m.budget_id = b.id
			...    RIGHT JOIN budgetdb.bd_item_depreciation de ON cat.id = de.account_category_id
			...    WHERE
			...        b.branch_id = 999 AND b.template_id = 3
			...            AND cat.name NOT LIKE 'Property And Equipment%'
			...    GROUP BY depreciation_rate , de.account_category_id , branch_id , cat.name) x
			...    JOIN (SELECT
			...        account_category_id,
			...            branch_id,
			...            forcasted_year,
			...            a.month_1,
			...            a.month_2,
			...            a.month_3,
			...            a.month_4,
			...            a.month_5,
			...            a.month_6,
			...            a.month_7,
			...            a.month_8,
			...            a.month_9,
			...            a.month_10,
			...            a.month_11,
			...            a.month_12
			...    FROM
			...        budgetdb.bd_budget b
			...    INNER JOIN budgetdb.bd_budget_monthly a ON a.budget_id = b.id
			...    WHERE
			...        b.branch_id = 999 AND b.template_id = 1
			...            AND account_category_id = 63) y ON x.account_category_id = y.account_category_id
			...        AND x.branch_id = y.branch_id) z;



    ${db_cpx_land}=      query     ${land_db_month1}
    ${test_db_land} =  set variable    ${db_cpx_land[0][0]}
    ${bud}=  CONVERT TO INTEGER    ${test_db_land}
    log to console    ${bud}
    should be equal as strings    ${bud}    ${b}


Month2 cpx
    [Arguments]     ${b}

  ${land_db_month2}=  catenate    SELECT    mon_qa_2  FROM
            ...    (SELECT
            ...        x.account_category_id,
            ...            x.branch_id,
			...            x.cat_name,
			...            @month1:=((x.m1 + y.forcasted_year) - ((x.m1 + y.forcasted_year) * (dep / 100)) / 12) AS mon_qa_1,
			...            @month2:=((x.m2 + @month1) - ((x.m2 + @month1) * (dep / 100)) / 12) AS mon_qa_2,
			...            @month3:=((x.m3 + @month2) - ((x.m3 + @month2) * (dep / 100)) / 12) AS mon_qa_3,
			...            @month4:=((x.m4 + @month3) - ((x.m4 + @month3) * (dep / 100)) / 12) AS mon_qa_4,
			...            @month5:=((x.m5 + @month4) - ((x.m5 + @month4) * (dep / 100)) / 12) AS mon_qa_5,
			...            @month6:=((x.m6 + @month5) - ((x.m6 + @month5) * (dep / 100)) / 12) AS mon_qa_6,
			...            @month7:=((x.m7 + @month6) - ((x.m7 + @month6) * (dep / 100)) / 12) AS mon_qa_7,
			...            @month8:=((x.m8 + @month7) - ((x.m8 + @month7) * (dep / 100)) / 12) AS mon_qa_8,
			...            @month9:=((x.m9 + @month8) - ((x.m9 + @month8) * (dep / 100)) / 12) AS mon_qa_9,
			...            @month10:=((x.m10 + @month9) - ((x.m10 + @month9) * (dep / 100)) / 12) AS mon_qa_10,
			...            @month11:=((x.m11 + @month10) - ((x.m11 + @month10) * (dep / 100)) / 12) AS mon_qa_11,
			...            @month12:=((x.m12 + @month11) - ((x.m12 + @month11) * (dep / 100)) / 12) AS mon_qa_12,
			...            month_1,
			...            month_2,
			...            month_3,
			...            month_4,
			...            month_5,
			...            month_6,
			...            month_7,
			...            month_8,
			...            month_9,
			...            month_10,
			...            month_11,
			...            month_12,
			...            CASE
			...                WHEN ROUND(@month1, 0) = ROUND(month_1, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_1_status,
			...            CASE
			...                WHEN ROUND(@month2, 0) = ROUND(month_2, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_2_status,
			...            CASE
			...                WHEN ROUND(@month3, 0) = ROUND(month_3, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_3_status,
			...            CASE
			...                WHEN ROUND(@month4, 0) = ROUND(month_4, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_4_status,
			...            CASE
			...                WHEN ROUND(@month5, 0) = ROUND(month_5, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_5_status,
			...            CASE
			...                WHEN ROUND(@month6, 0) = ROUND(month_6, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_6_status,
			...            CASE
			...                WHEN ROUND(@month7, 0) = ROUND(month_7, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_7_status,
			...            CASE
			...                WHEN ROUND(@month8, 0) = ROUND(month_8, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_8_status,
			...            CASE
			...                WHEN ROUND(@month9, 0) = ROUND(month_9, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_9_status,
			...            CASE
			...                WHEN ROUND(@month10, 0) = ROUND(month_10, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_10_status,
			...            CASE
			...                WHEN ROUND(@month11, 0) = ROUND(month_11, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_11_status,
			...            CASE
			...                WHEN ROUND(@month12, 0) = ROUND(month_12, 0) THEN 'pass'
			...                ELSE 'fail'
			...            END AS mnth_12_status
			...    FROM
			...        (SELECT
			...        de.depreciation_rate AS dep,
			...            de.account_category_id,
			...            branch_id,
			...            cat.name AS cat_name,
			...            SUM(m.month_1 * b.budget_rate) AS m1,
			...            SUM(m.month_2 * b.budget_rate) AS m2,
			...            SUM(m.month_3 * b.budget_rate) AS m3,
			...            SUM(m.month_4 * b.budget_rate) AS m4,
			...            SUM(m.month_5 * b.budget_rate) AS m5,
			...            SUM(m.month_6 * b.budget_rate) AS m6,
			...            SUM(m.month_7 * b.budget_rate) AS m7,
			...            SUM(m.month_8 * b.budget_rate) AS m8,
			...            SUM(m.month_9 * b.budget_rate) AS m9,
			...            SUM(m.month_10 * b.budget_rate) AS m10,
			...            SUM(m.month_11 * b.budget_rate) AS m11,
			...            SUM(m.month_12 * b.budget_rate) AS m12
			...    FROM
			...        budgetdb.bd_budget b
			...    INNER JOIN budgetdb.bd_account_category cat ON b.account_category_id = cat.id
			...    INNER JOIN budgetdb.bd_budget_monthly m ON m.budget_id = b.id
			...    RIGHT JOIN budgetdb.bd_item_depreciation de ON cat.id = de.account_category_id
			...    WHERE
			...        b.branch_id = 999 AND b.template_id = 3
			...            AND cat.name NOT LIKE 'Property And Equipment%'
			...    GROUP BY depreciation_rate , de.account_category_id , branch_id , cat.name) x
			...    JOIN (SELECT
			...        account_category_id,
			...            branch_id,
			...            forcasted_year,
			...            a.month_1,
			...            a.month_2,
			...            a.month_3,
			...            a.month_4,
			...            a.month_5,
			...            a.month_6,
			...            a.month_7,
			...            a.month_8,
			...            a.month_9,
			...            a.month_10,
			...            a.month_11,
			...            a.month_12
			...    FROM
			...        budgetdb.bd_budget b
			...    INNER JOIN budgetdb.bd_budget_monthly a ON a.budget_id = b.id
			...    WHERE
			...        b.branch_id = 999 AND b.template_id = 1
			...            AND account_category_id = 63) y ON x.account_category_id = y.account_category_id
			...        AND x.branch_id = y.branch_id) z;
    ${db_cpx_land_month2}=   query     ${land_db_month2}
    ${test_db_land_month2} =  set variable    ${db_cpx_land_month2[0][0]}
    ${value_land_month2}=  CONVERT TO INTEGER    ${test_db_land_month2}
    log to console    == database month2= ${value_land_month2}
    should be equal as strings    ${value_land_month2}    ${b}


#    ${db_cpx_land_month2}=  query   execute sql script    ${EXECDIR}/databases/capex_month2.sql
#    ${test_db_land_month2} =  set variable    ${db_cpx_land_month2[0][0]}
#    ${value_land_month2}=  CONVERT TO INTEGER    ${test_db_land_month2}
#    log to console    ============$$$$$${value_land_month2}
#    should be equal as strings    ${value_land_month2}    ${b}
