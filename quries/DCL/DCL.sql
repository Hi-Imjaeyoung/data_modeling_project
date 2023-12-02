-- 총 관리자 계정 2개 생성
create user General_Manager1@localhost identified by 'test1234';
create user General_Manager2@localhost identified by 'test1234';

-- 총관리자는 모든 권한을 가짐
GRANT ALL PRIVILEGES ON *.* TO General_Manager1@localhost WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO General_Manager2@localhost WITH GRANT OPTION;

-- 총 관리자 권한 확인 명령어
SHOW GRANTS FOR General_Manager1@localhost;
SHOW GRANTS FOR General_Manager2@localhost;

-- 계정 목록 확인
use mysql;
select host, user, password from user;