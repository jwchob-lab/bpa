디자인 유지하면서 내용 다 지우고 새로운 기능 만들어줘
아래와 같이 튜닝용 풀쿼리 받아서 xplan 돌리는 쿼리 만들어줘

1. 쿼리 입력
i_input_1

2. 쿼리 입력한 부분을 아래 i_input_1 부분에 채워줘
ALTER SESSION SET CURRENT_SCHEMA = 유저명 ;
SELECT /*+ GATHER_PLAN_STATISTICS */ * FROM (
i_input_1
) ;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL,NULL,'ALLSTATS LAST'));