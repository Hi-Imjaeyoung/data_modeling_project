--RE0001 이메일과 비밀번호 ,이름, 전화번호, 생년월일, 닉네임 가입할 때 role 기본값은 user , active 기본값은 0 이어야함. 승인을 하는 update 쿼리를 통해 1로 변경됨
insert into members (email, passwd, name, phone_number, birth, nickname) values (
'test1234@naver.com', '1234', '이혜선', '01012341234', '19900101','emma') ;
update members set active = 1 where id = 1;

-- RE0002 기존에 있는 email과 같은 email로 insert 쿼리를 실행시 unique에 걸려 insert가 되지 않아야함
select * from members;
insert into members (email, passwd, name, phone_number, birth, nickname) values (
'test1234@naver.com', '1234', '이혜선', '01012341234', '19900101','emma') ;
insert into members (email, passwd, name, phone_number, birth, nickname) values (
'test1234@naver.com', '4321', '이선혜', '01012341234', '19900101','emma') ;

-- RE0003 회원탈퇴사유 없이 disabled_member에 데이터 insert 시 오류가 나야함.
-- RE0006 disabled_member에 데이터 insert시 advice 칼럼이 null 이어도 오류가 나지 않음 

insert into disabled_members(member_id,reason,advise)values(14,'그냥','UI가 이상해요');
insert into disabled_members(member_id,reason)values(13,'공부해야해요');
insert into disabled_members(member_id)values(13);

-- RE0007 movie 기본 정보 없이 insert시 오류 발생
insert into movies(review,content_rating,running_time,release_date,title)values('재밌었어요','12years','120',20130305,'메간');

-- RE0008 movie의 다른 정보를 가진 정보들을 movie_id 로 연결되어 있어야 한다.
select * from movies as ms 
inner join  movie_actor as ma on ms.id=ma.movie_id 
left join actor as a on ma.actor_id=a.id;

-- RE0010 movie 테이블에 content_rating 을 통해 성인 콘테츠을 포함/포함하지 않은 select 가 가능해야함
select * from movies where content_rating != 'No Adolescent';
select * from movies where content_rating = 'No Adolescent';

-- RE0012 회원은 배우로 검색했을때 해당 배우가 나오는 작품 리스트를 볼 수 있다.
select C.actor, A.title, A.summary, A.review, A.content_rating from movies as A 
inner join movie_actor as B on A.id = B.movie_id left join actor as C on b.actor_id = C.id where C.actor = "마동석";

-- RE0013 회원은 장르로 검색했을때 해당 장르인 작품 리스트를 볼 수 있다.
select movies.title as 제목 from genre inner join movie_genre on movie_genre.genre_id = genre.id 
inner join movies on movies.id = movie_genre.movie_id where genre.genre = "공포";

-- RE0014 회원은 다중의 키워드로 검색하여 작품 리스트를 볼 수 있다. 
select * from movies m
left join movie_actor ma on m.id = ma.movie_id
left join actor a on a.id = ma.actor_id
left join movie_genre mg on m.id = mg.movie_id
left join genre g on g.id = mg.genre_id
where a.actor = "유연석" and g.genre = "스릴러";

-- RE0021 favoite 테이블에서 좋아요를 찍은 영화별로 count, limit 10을 걸어 리스트 출력
select * from favorite;
select count(*) AS cnt, m.title from favorite f
left join movies m on f.movie_id = m.id
group by movie_id order by cnt desc;

-- RE0022 최신 리뷰가 생성된 영화 검색 일주일 동안 생성된 영화만 출력
select * from review;
select a.title, b.detail from movies as a inner join review as b on a.id = b.movie_id
 where b.created_date > date_add(now(),interval -7 day) and b.detail is not null;

 --RE0023 영화 삭제시 mapping 테이블 row가 삭제되고, 리뷰와 fovorite 연관 테이블의 row 값이 외래키 제약조건 값처럼 처리
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