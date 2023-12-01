

-- 장르

  

insert genre(genre) values("액션");

insert genre(genre) values("SF");

insert genre(genre) values("판타지");

insert genre(genre) values("어드벤처");

insert genre(genre) values("범죄");

insert genre(genre) values("스릴러");

insert genre(genre) values("미스터리");

insert genre(genre) values("코미디");

insert genre(genre) values("멜로/로맨스");

insert genre(genre) values("드라마");

insert genre(genre) values("애니메이션");

insert genre(genre) values("공포");

insert genre(genre) values("예능");

insert genre(genre) values("다큐멘터리");

insert genre(genre) values("음악");

insert genre(genre) values("가족");

insert genre(genre) values("서부극");

insert genre(genre) values("전쟁");

insert genre(genre) values("공연");

insert genre(genre) values("성인");

  
  

-- actor

  

insert into actor(id,actor,info)values(1,'김수현','YG');

insert into actor(id,actor,info)values(2,'김혜수','SM');

insert into actor(id,actor,info)values(3,'수지','JYP');

insert into actor(id,actor,info)values(4,'조정석','JYP');

insert into actor(id,actor,info)values(5,'박해일','SM');

insert into actor(id,actor,info)values(6,'조인성','YG');

insert into actor(id,actor,info)values(7,'홍수아','SM');

insert into actor(id,actor,info)values(8,'윤여정','YG');

insert into actor(id,actor,info)values(9,'한지민','YG');

  

-- nation

  

insert into nation(id,nation)values(1,'미국');

insert into nation(id,nation)values(2,'중국');

insert into nation(id,nation)values(3,'일본');

insert into nation(id,nation)values(4,'인도');

insert into nation(id,nation)values(5,'태국');

insert into nation(id,nation)values(6,'브라질');

insert into nation(id,nation)values(7,'영국');

insert into nation(id,nation)values(8,'프랑스');

insert into nation(id,nation)values(9,'브라질');

  

-- ott

  

insert into ott(id,ott)values(1,'NETFLIX');

insert into ott(id,ott)values(2,'WAVVE');

insert into ott(id,ott)values(3,'WATCHA');

insert into ott(id,ott)values(4,'APPLE TV');

insert into ott(id,ott)values(5,'COUPANG PLAY');

insert into ott(id,ott)values(6,'DISNEY PLUS');

  

-- horror movies

select * from movies;

  

insert into movies(summary, review, content_rating,running_time,trailer,release_date,title)

values('살아 움직이는 인형 같은 ai 로봇을 제작한 로봇공학자','인형얼굴한대치고싶다','15years','104','https://youtu.be/G066QXvMVjE?si=30GsElndeM_c2gp-','20230301','메간');

  

insert into movies(summary, review, content_rating,running_time,trailer,release_date,title)

values('공포의 402호병동','여기근처 집값 폭락하는소','15years','90','https://youtu.be/CjcVZVxL_3c?si=ssTAUfe9gIvAKWyB','20170501','곤지암');

  

insert into movies(summary, review, content_rating,running_time,trailer,release_date,title)

values('가문에 얽힌 불길한 오랜 저주를 마주해야한다.','강아지ㅠ','15years','104','https://youtu.be/G066QXvMVjE?si=30GsElndeM_c2gp-','20210701','랑종');

  

--director

  

insert into director(director)values('필감성');

insert into director(director)values('이응복');

insert into director(director)values('이상용');

insert into director(director)values('크리스 벅');

insert into director(director)values('켈시 맨');

insert into director(director)values('피터 손');

insert into director(director)values('제임스건');

insert into director(director)values('김대우');

insert into director(director)values('호소다 마모루');

insert into director(director)values('미야자키 하야오');

insert into director(director)values('박찬욱');

insert into director(director)values('히라마키 다이스케');

insert into director(director)values('이리에 야스히로');

insert into director(director)values('소토자키 하루오');

insert into director(director)values('데이미언 셔젤');

insert into director(director)values('박성후');

insert into director(director)values('제라드 존스톤');

insert into director(director)values('기차드 커티스');

insert into director(director)values('조아킴 도스 샌토스');

insert into director(director)values('정범식');

insert into director(director)values('반종 피산다나 쿤');

  
  
  

--movie_director

  

insert into movie_director(id,director_id,movie_id)values(1,1,1);

insert into movie_director(id,director_id,movie_id)values(2,2,2);

insert into movie_director(id,director_id,movie_id)values(3,3,3);

insert into movie_director(id,director_id,movie_id)values(4,4,4);

insert into movie_director(id,director_id,movie_id)values(5,5,5);

insert into movie_director(id,director_id,movie_id)values(6,6,6);

insert into movie_director(id,director_id,movie_id)values(7,7,7);

insert into movie_director(id,director_id,movie_id)values(8,8,8);

insert into movie_director(id,director_id,movie_id)values(9,9,9);

insert into movie_director(id,director_id,movie_id)values(10,10,10);

insert into movie_director(id,director_id,movie_id)values(11,11,11);

insert into movie_director(id,director_id,movie_id)values(12,12,12);

insert into movie_director(id,director_id,movie_id)values(13,13,13);

insert into movie_director(id,director_id,movie_id)values(14,14,14);

insert into movie_director(id,director_id,movie_id)values(15,15,15);

insert into movie_director(id,director_id,movie_id)values(16,16,16);

insert into movie_director(id,director_id,movie_id)values(17,17,17);

insert into movie_director(id,director_id,movie_id)values(18,18,18);

insert into movie_director(id,director_id,movie_id)values(19,19,19);

insert into movie_director(id,director_id,movie_id)values(20,20,20);

insert into movie_director(id,director_id,movie_id)values(21,21,21);

  

--award

  

insert into award(id, award)values(1,'청룡영화상');

insert into award(id, award)values(2,'대종상영화제');

insert into award(id, award)values(3,'부산국제영화제');

insert into award(id, award)values(4,'벤쿠버국제영화제');

insert into award(id, award)values(5,'미국아카데미시상식');

insert into award(id, award)values(6,'시드니영화제');

insert into award(id, award)values(7,'모스크바국제영화제');

insert into award(id, award)values(8,'마라케시국제영화제');

insert into award(id, award)values(9,'칸영화제');

insert into award(id, award)values(10,'베니스국제영화제');

insert into award(id, award)values(11,'베를린국제영화제');

insert into award(id, award)values(12,'토론토국제영화제');

  

--members

  

insert into members(id,email,name,birth,sex,phone_number,nickname,role,active)

values(1,'first@naver.com','firstname','19901224','M','01011110000','onetime','user','1');

  

insert into members(id,email,name,birth,sex,phone_number,nickname,role,active)

values(2,'second@naver.com','secondname','19901224','F','01022220000','twotimes','user','1');

  

insert into members(id,email,name,birth,sex,phone_number,nickname,role,active)

values(3,'third@naver.com','thirdname','19901220','M','01033330000','thirdtime','admin','1');

  

insert into members(id,email,name,birth,sex,phone_number,nickname,role,active)

values(4,'fourth@naver.com','fourthname','19941018','F','01044440000','fourthtime','user','1');

  

insert into members(id,email,name,birth,sex,phone_number,nickname,role,active)

values(6,'fifth@google.com','fifthname','19920303','M','01055550000','fifthtime','user','1');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('iloveoneteam@google.com','김사랑','19931221','F','01023234152','ilovekim','user','1');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('moviejoeum@google.com','김지은','19941109','F','01043423313','영화사랑','user','1');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('blackpink111@naver.com','김제니','19980123','F','01023245532','jennie','user','1');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('flowerjisoo@google.com','김지수','19971221','F','01073734452','blackpinkjisoo','user','1');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('ssirumjoa@naver.com','강호동','19700611','M','01093932432','hodongenyamyam','user','1');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('piddamnunmul@google.com','정국','19981223','M','01093230052','dinamite','admin','0');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('qawsed123@hanhwa.com','김한화','19880229','M','01022234152','hanhwasystem','admin','1');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('noonnoonanna@google.com','jessie','19931111','F','01032334152','ssenonni','admin','1');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('lili777@google.com','rihanna','19901124','F','01012234152','workdrake','user','1');

  

insert into members(email,name,birth,sex,phone_number,nickname,role,active)

values('leesungki@google.com','이승기','19830506','M','01023234151','delete','user','0');