SELECT 1
FROM {{ ref('playing_with_tests') }}
HAVING NOT(SUM(c_acctbal) <= 1e8)
