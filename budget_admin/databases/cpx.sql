SELECT    mon_qa_2  FROM
                 (SELECT
                     x.account_category_id,
                         x.branch_id,
			             x.cat_name,
			             @month1:=((x.m1 + y.forcasted_year) - ((x.m1 + y.forcasted_year) * (dep / 100)) / 12) AS mon_qa_1,
			             @month2:=((x.m2 + @month1) - ((x.m2 + @month1) * (dep / 100)) / 12) AS mon_qa_2,
			             month_1,
			             month_2,
			             CASE
			                 WHEN ROUND(@month1, 0) = ROUND(month_1, 0) THEN 'pass'
			                 ELSE 'fail'
			             END AS mnth_1_status,
			             CASE
			                 WHEN ROUND(@month2, 0) = ROUND(month_2, 0) THEN 'pass'
			                 ELSE 'fail'
			             END AS mnth_2_status

			     FROM
			         (SELECT
			         de.depreciation_rate AS dep,
			             de.account_category_id,
			             branch_id,
			             cat.name AS cat_name,
			             SUM(m.month_1 * b.budget_rate) AS m1,
			             SUM(m.month_2 * b.budget_rate) AS m2

			     FROM
			         budgetdb.bd_budget b
			     INNER JOIN budgetdb.bd_account_category cat ON b.account_category_id = cat.id
			     INNER JOIN budgetdb.bd_budget_monthly m ON m.budget_id = b.id
			     RIGHT JOIN budgetdb.bd_item_depreciation de ON cat.id = de.account_category_id
			     WHERE
			         b.branch_id = 999 AND b.template_id = 3
			             AND cat.name NOT LIKE 'Property And Equipment%'
			     GROUP BY depreciation_rate , de.account_category_id , branch_id , cat.name) x
			     JOIN (SELECT
			         account_category_id,
			             branch_id,
			             forcasted_year,
			             a.month_1,
			             a.month_2

			     FROM
			         budgetdb.bd_budget b
			     INNER JOIN budgetdb.bd_budget_monthly a ON a.budget_id = b.id
			     WHERE
			         b.branch_id = 999 AND b.template_id = 1
			             AND account_category_id = 63) y ON x.account_category_id = y.account_category_id
			         AND x.branch_id = y.branch_id) z;