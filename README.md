
![header](https://capsule-render.vercel.app/api?type=wave&color=auto&height=300&section=header&text=ONETEAM이%20만든%20ONETT&fontSize=50)

## ONETEAM 이 만드는 ONETT(One Trendy Time)<br/>

### 이종표,이혜선,임재영,조훈

<br/><img src="https://img.shields.io/badge/MySQL-바탕색?style=flat&logo=SQL&logoColor=white"/> <img src="https://img.shields.io/badge/Redis-DC382D?style=flat-square&logo=Redis&logoColor=red"/> <img src="https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=Redis&logoColor=red"/>

<br/>

## 😆서비스 설명

넷플릭스, 티빙, 왓챠, 디즈니 플러스 등 셀 수 없는 OTT의 홍수 속에 살아가며 내가 원하는 콘테츠가 어떤 OTT에서 서비스 되고 있는지 알아내기가 쉽지 않습니다.
나는 어떤 콘텐츠를 어디서 볼 수 있는지 One Trendy Time 으로 쉽게 알아볼 수 있습니다.

각 OTT에서 서비스 되는 콘텐츠를 장르, 배우, 받은 상 등 각 테마로 검색할 수 있고 내가 본 영화 목록을 저장해 기억할 수 있습니다.
최신 리뷰 수의 영화를 검색할 수 있어 다양한 유저들이 흥미를 가지고 있는 영화들을 알 수 있습니다.

ONETT와 함께 하나의 트렌디한 시간을 가져보세요.

# project_overview

## 🤔요구사항 정의서

<img width="1484" alt="스크린샷 2023-12-02 오후 8 23 09" src="https://github.com/hyesunlee30/data_modeling_1team/assets/142702766/7f56b562-f6d0-4b5f-aebf-7582a9143648">

- 영화 검색 (OTT, 배우, 국가, 감독, 장르, 어워드) <br/>
- 영화 기록 (내가 본 영화 기록, 좋아하는 영화 목록, 싫어하는 영화 목록) <br/>
- 리뷰 (영화 별 평정, 리뷰기록), 최신 리뷰순 영화 목록 조회 <br/>
- 회원 가입 (이메일 인증 후 계정 활성화, 기본값만으로 가입 가능) <br/>
- 회원 정보 수정 (마이페이지에서 수정) <br/>
- 회원 탈퇴 (탈퇴시 탈퇴사유 입력, 회원 정보는 개인정보 정책에 따라 삭제 바로 삭제 되지 않을 수 있음) <br/>
- 최신 조회 영화 10건 목록 조회 <br />

# 🤗프로젝트

## 1. 개념적 모델링

- movie 라는 테이블에 기본 정보들을 나열한 뒤에, 한 컬럼에 여러 컬럼이 들어가야 하는 것들을 빼서 1차 정규화를 했습니다. 
- movie - ott 는 한 영화는 많은 OTT를 가지며, 한 OTT도 많은 영화를 가질 수 있는 다대다 관계로 일대다 관계로 풀어줄 맵핑 테이블 movie_ott 을 설계했습니다.
- 배우, 국가, 감독, 장르, 어워드 테이블 또한 같습니다. 
- watched_movie 와 review, fovorite 테이블은 멤버의 영화에 대한 행동을 정의한 테이블들로 movie, member와 필수적이고 일대다 관계를 가지며 행동 정의 테이블은 옵셔널합니다.
- member의 active 값을 통해 disabled_member에 탈퇴이유와 조언들을 남기고 member의 정보를 제약조건을 통해 물리적 삭제하지 않고 개인정보 정책에 맞게 논리적 삭제할 수 있도록 설계했습니다. 


<img src="https://github.com/hyesunlee30/data_modeling_1team/blob/main/data_modeling/ERD/%EB%A7%88%EC%A7%80%EB%A7%89%20%EA%B0%9C%EB%85%90%20erd_hyesun20231204.drawio.png?raw=true"/>

## 2. 논리적 모델링

<img src="https://github.com/hyesunlee30/data_modeling_1team/blob/main/data_modeling/ERD/%E3%84%B9%E3%85%87%E3%84%B9%E3%85%87%EC%B5%9C%EC%A2%85.drawio.png?raw=true"/>
<br/>
<br/>

## 3. 물리적 모델링 주요 쿼리

## create table <br/>

```sql
-- members
Create table members(id bigint primary key auto_increment, email varchar(50) not null unique,passwd varchar(20) not null ,name varchar(50) not null
,birth DATE not null, sex Enum('M','F'), phone_number varchar(15) not null, nickname varchar(50) unique,
role Enum('user','admin') not null default('user'), active tinyint(1) default 0);

-- movies
Create table movies(id bigint primary key auto_increment, summary text not null, review varchar(1000), content_rating Enum(
'All','12years','15years','No Adolescent') not null, running_time INT unsigned not null, trailer varchar(255),
release_date DATE not null,title varchar(250) not null);

-- disabled_members
create table disabled_members(id bigint primary key auto_increment, member_id bigint not null, reason varchar(1000) not null, advise varchar(1000),
foreign key(member_id) references members(id));

-- review
create table review(id bigint primary key auto_increment,grade tinyint unsigned not null, movie_id bigint not null,
user_id bigint not null, detail text not null ,
created_date datetime default current_timestamp,
update_date datetime default current_timestamp,
foreign key(movie_id) references movies(id) on delete cascade on update cascade,foreign key(user_id) references members(id));

-- favorite
create table favorite(id bigint primary key auto_increment,movie_id bigint not null, user_id bigint not null,love tinyint(1) not null default 0,
dislike tinyint(1) not null default 0,
created_date datetime default current_timestamp,
update_date datetime default current_timestamp,
foreign key(movie_id) references movies(id) on delete cascade on update cascade,
foreign key(user_id) references members(id));

-- watched_movie
create table watched_movie(id bigint primary key auto_increment,movie_id bigint not null, user_id bigint not null,
foreign key(movie_id) references movies(id) on delete cascade on update cascade,
created_date datetime default current_timestamp,
update_date datetime default current_timestamp,
foreign key(user_id) references members(id));

-- award
create table award(id bigint primary key auto_increment, award varchar(50) not null);
-- movie_award
create table movie_award(id bigint primary key auto_increment, award_id bigint  not null, movie_id bigint not null,
foreign key(award_id) references award(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- genre
create table genre(id bigint primary key auto_increment, genre varchar(50) not null);
create table movie_genre(id bigint primary key auto_increment, genre_id bigint  not null, movie_id bigint not null,
foreign key(genre_id) references genre(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- ott
create table ott(id bigint primary key auto_increment, ott varchar(50) not null);
create table movie_ott(id bigint primary key auto_increment, ott_id bigint  not null, movie_id bigint not null,
foreign key(ott_id) references ott(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- actor
create table actor(id bigint primary key auto_increment, actor varchar(50) not null,info varchar(255));
create table movie_actor(id bigint primary key auto_increment, actor_id bigint  not null, movie_id bigint not null,
foreign key(actor_id) references actor(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- director
create table director(id bigint primary key auto_increment, directorr varchar(50) not null);
create table movie_director(id bigint primary key, director_id bigint  not null, movie_id bigint not null,
foreign key(director_id) references director(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);

-- nation
create table nation(id bigint primary key auto_increment, nation varchar(50) not null);
create table movie_nation(id bigint primary key, nation_id bigint  not null, movie_id bigint not null,
foreign key(nation_id) references nation(id),foreign key(movie_id) references movies(id) on delete cascade on update cascade);
```

## insert data

```sql
-- members 테이블 데이터 추가
INSERT INTO ott.members (email, name, birth, sex, phone_number, nickname, role, active) VALUES ('first@naver.com', 'firstname', '19901224', 'M', '01011110000', 'onetime', 'user');

-- movies
INSERT INTO ott.movies (summary, review, content_rating, running_time, trailer, release_date, title) 
VALUES ('오택이 고액을 제시하는 목포행 손님을 태우고 가다 그가 연쇄살인마임을 깨닫게 되면서 공포의 주행을 시작하게 되는 이야기를 담은 스릴러 시리즈', null, 'No Adolescent', 600, 'https://youtu.be/UUAj8dfuvAs', '2023-11-20', '운수 오진날 1시즌');

-- ott 테이블 데이터 추가
INSERT INTO ott.ott (ott) VALUES ('NETFLIX');

-- movie와 ott의 맵핑테이블인 movie_ott 테이블 데이터 추가
insert into movie_ott(ott_id, movie_id) values (7,1);

-- review 테이블 데이터 추가
INSERT INTO ott.review (grade, movie_id, user_id, detail) VALUES (1, 2, 1, 2, '마동석 ㅋㅋㅋ 재밌게 봣어요');

-- favorite 테이블 데이터 추가
INSERT INTO ott.favorite (movie_id, user_id, love, dislike) VALUES (12, 11, 1, 0);

-- watched_movie 테이블 데이터 추가	
INSERT INTO ott.watched_movie (movie_id, user_id) VALUES (3, 3);
```

## 4. 프로젝트 관리

### WBS

[WBS](https://docs.google.com/spreadsheets/d/18YNMnxvCihb60FS0_cGEvzS2jzDiq4Dp/edit#gid=1057334268) _Click here_
<img width="1203" alt="스크린샷 2023-12-01 오후 9 27 13" src="https://github.com/hyesunlee30/data_modeling_1team/assets/142702766/b54f07d2-772d-4ae3-8e91-bec782c7cbd0">

초기 일정관리 및 수정되는 일정관리들에 대해 고민하며 WBS를 통해 각 업무에 대해 세부적인 일정관리를 진행하였습니다.
<br/>

### _JIRA_

[Jira](https://hyesun.atlassian.net/jira/software/projects/ON/boards/1?selectedIssue=ON-38) _클릭시 이동_<br/>

<img width="1236" alt="스크린샷 2023-12-01 오후 10 15 37" src="https://github.com/hyesunlee30/data_modeling_1team/assets/142702766/8a965c5e-d06a-44bc-9645-8d206166c509">

git과 연결 시켜 Jira를 통해 이슈를 관리하고 각 브랜치로 작업 후 pr 을 보내 팀장이 merge 하며 형상관리 하였습니다.

## 5.회의록

매일 회의를 하며 아이디어들과 추가 및 수정 삭제 되는 컬럼 및 속성들을 기록하며 프로젝트를 발전시켰습니다.
<img width="1123" alt="스크린샷 2023-12-02 오후 8 08 14" src="https://github.com/hyesunlee30/data_modeling_1team/assets/142702766/d9079a43-26a7-46bc-92f3-a3452779ff54">

# 🤩프로젝트 테스트

## 1. 테스트케이스 정의서 

<img width="1312" alt="스크린샷 2023-12-02 오후 7 46 53" src="https://github.com/hyesunlee30/data_modeling_1team/assets/142702766/8f2fae58-9454-44e8-aef4-60ccbe6ccaa2">


## 2. TEST quries


```sql
-- 이메일과 비밀번호 ,이름, 전화번호, 생년월일, 닉네임 가입할 때 role 기본값은 user , active 기본값은 0 이어야함. 승인을 하는 update 쿼리를 통해 1로 변경됨
insert into members (email, passwd, name, phone_number, birth, nickname) values (
'test1234@naver.com', '1234', '이혜선', '01012341234', '19900101','emma') ;
update members set active = 1 where id = 1;
```
![RE0001](https://github.com/hyesunlee30/data_modeling_1team/assets/106050747/8567c61e-19b9-4d15-b766-509b39825535)



```sql
-- 기존에 있는 email과 같은 email로 insert 쿼리를 실행시 unique에 걸려 insert가 되지 않아야함
select * from members;
insert into members (email, passwd, name, phone_number, birth, nickname) values (
'test1234@naver.com', '1234', '이혜선', '01012341234', '19900101','emma') ;
insert into members (email, passwd, name, phone_number, birth, nickname) values (
'test1234@naver.com', '4321', '이선혜', '01012341234', '19900101','emma') ;
```

```sql
-- movie 기본 정보 없이 insert시 오류 발생
insert into movies(review,content_rating,running_time,release_date,title)values('재밌었어요','12years','120',20130305,'메간');
```

```sql
-- movie의 다른 정보를 가진 정보들을 movie_id 로 연결되어 있어야 한다.
select * from movies as ms
inner join  movie_actor as ma on ms.id=ma.movie_id
left join actor as a on ma.actor_id=a.id;
```

```sql
-- disabled_member에 데이터 insert시 advice 칼럼이 null 이어도 오류가 나지 않음

insert into disabled_members(member_id,reason,advise)values(14,'그냥','UI가 이상해요');
insert into disabled_members(member_id,reason)values(13,'공부해야해요');
insert into disabled_members(member_id)values(13);

-- movie 테이블에 content_rating 을 통해 성인 콘테츠을 포함/포함하지 않은 select 가 가능해야함
select * from movies where content_rating != 'No Adolescent';
select * from movies where content_rating = 'No Adolescent';
```

```sql
-- 회원은 배우로 검색했을때 해당 배우가 나오는 작품 리스트를 볼 수 있다.
select C.actor, A.title, A.summary, A.review, A.content_rating from movies as A
inner join movie_actor as B on A.id = B.movie_id left join actor as C on b.actor_id = C.id where C.actor = "마동석";
```

```sql
-- 회원은 장르로 검색했을때 해당 장르인 작품 리스트를 볼 수 있다.
select movies.title as 제목 from genre inner join movie_genre on movie_genre.genre_id = genre.id
inner join movies on movies.id = movie_genre.movie_id where genre.genre = "공포";
```

```sql
-- 회원은 다중의 키워드로 검색하여 작품 리스트를 볼 수 있다.
select * from movies m
left join movie_actor ma on m.id = ma.movie_id
left join actor a on a.id = ma.actor_id
left join movie_genre mg on m.id = mg.movie_id
left join genre g on g.id = mg.genre_id
where a.actor = "유연석" and g.genre = "스릴러";
```

```sql
-- favoite 테이블에서 좋아요를 찍은 영화별로 count, limit 10을 걸어 리스트 출력
select * from favorite;
select count(*) AS cnt, m.title from favorite f
left join movies m on f.movie_id = m.id
group by movie_id order by cnt desc;
```

```sql
-- 최신 리뷰가 생성된 영화 검색 일주일 동안 생성된 영화만 출력
select * from review;
select a.title, b.detail from movies as a inner join review as b on a.id = b.movie_id
 where b.created_date > date_add(now(),interval -7 day) and b.detail is not null;
```

```sql
 --영화 삭제시 mapping 테이블 row가 삭제되고, 리뷰와 fovorite 연관 테이블의 row 값이 외래키 제약조건 값처럼 처리
insert into members (id,email, passwd, name, phone_number, birth, nickname) values (
'1','test1234@naver.com', '1234', '이혜선', '01012341234', '19900101','emma') ;
INSERT INTO test.movies (id, summary, review, content_rating, running_time, trailer, release_date,title)
VALUES ('1','잼있다', '굿', '12years', '123', 'sss', '2020-12-01', '재영이의 일요일');

INSERT INTO test.review (`grade`, `movie_id`, `user_id`, `detail`) VALUES (4, 1, 1, '넘 졸리던데요');
INSERT INTO test.award (id,award) VALUES (1,'재영상');
INSERT INTO test.movie_award (award_id,movie_id) VALUES (1,1);
INSERT INTO favorite(id, user_id,love,) values(1,1,1);
DELETE FROM test.movies WHERE (id = 1);
select * from test.movie_award;
select * from test.review;
select * from test.favoite;
```

## 테스팅 영상

## redis를 이용하여 구현한 최근 조회 영화 10건 리스트 입니다. <img src="https://img.shields.io/badge/Redis-DC382D?style=flat-square&logo=Redis&logoColor=red"/>

<br/>
<img src="https://github.com/hyesunlee30/data_modeling_1team/blob/main/redis/redis%EB%A5%BC%20%EC%9D%B4%EC%9A%A9%ED%95%9C%20%EC%B5%9C%EA%B7%BC%20%EC%A1%B0%ED%9A%8C%20%EC%98%81%ED%99%94%20%EB%AA%A9%EB%A1%9D%2010%EA%B1%B4%20%EC%A1%B0%ED%9A%8C%20%EA%B8%B0%EB%8A%A5%20%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8.PNG">

## 마지막 한 줄 회고록

<br/>

|  팀원  |                                                     회고록                                                     |
| :----: | :------------------------------------------------------------------------------------------------------------: |
| 이혜선 | "멋진 팀원들을 만나 매일이 행복한 프로젝트였습니다. 다양한 테이블에 관계에 대해 고민해볼 수 있어 재밌었습니다. |
|  조훈  |     "서비스구축부터 DB까지 직접 작성해보니 개발에 대한 대략적인 뼈대가 잡힌 것 같아 보람찬 시간이였습니다"     |
| 임재영 |                                                   "의견좋다"                                                   |
| 이종표 |                                                   "프로젝트 진행 중 DB와 git에 대한 이해가 높아지고 좋은 경험을 쌓아서 좋았습니다."                                                   |

<br/>

![header](https://capsule-render.vercel.app/api?type=rect&height=200&text=We%20Are%20"The%20ONE"&fontAlign=50&stroke=00FF00)

