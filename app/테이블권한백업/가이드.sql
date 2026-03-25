
아래와 같이 테이블명을 받아서 쿼리를 만들어줘
대문자로 변환해줘

테이블명1
테이블명2
테이블명3



--1. 테이블 권한 확인
SELECT * FROM DBA_TAB_PRIVS WHERE TABLE_NAME IN (
'테이블명1'
,'테이블명2'
,'테이블명3'
) ORDER BY GRANTABLE DESC, OWNER, TABLE_NAME
;




--2. 권한문 생성
SELECT 'GRANT '||PRIVILEGE||' ON '||OWNER||'.'||TABLE_NAME||' TO '||GRANTEE||';' FROM DBA_TAB_PRIVS
WHERE UPPER(TABLE_NAME) IN (
'테이블명1'
,'테이블명2'
,'테이블명3'
)
ORDER BY TABLE_NAME 
;
