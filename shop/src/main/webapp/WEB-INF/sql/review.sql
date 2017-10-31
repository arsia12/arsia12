ALTER TABLE review
	DROP CONSTRAINT "FK_MEMBER_TO_review"; -- 회원 -> 후기게시판

-- 후기게시판
ALTER TABLE review
	DROP CONSTRAINT "PK_review"; -- 후기게시판 기본키

-- 후기게시판
DROP TABLE review;

-- 후기게시판
CREATE TABLE "review" (
	"IDX"     NUMBER(8)      NOT NULL, -- 글번호
	"ID"      VARCHAR2(30)   NOT NULL, -- 작성자
	"SUBJECT" VARCHAR2(200)  NOT NULL, -- 글제목
	"CONTENT" VARCHAR2(2000) NOT NULL, -- 글내용
    "FILENAME1" VARCHAR2(100) NULL, -- 파일명1
	"FILENAME2" VARCHAR2(100) NULL, -- 파일명2
	"FILENAME3" VARCHAR2(100) NULL, -- 파일명3
	"FILENAME4" VARCHAR2(100) NULL, -- 파일명4
	"WDATE"   DATE           NOT NULL, -- 작성일
	"READNUM" NUMBER(8)      NOT NULL, -- 조회수
	"USEYN"   VARCHAR2(2)    NOT NULL, -- 사용
	"MIDX"    NUMBER(8,0)    NOT NULL  -- 회원번호
);


-- 후기게시판 기본키
CREATE UNIQUE INDEX "PK_review"
	ON "review" ( -- 후기게시판
		"IDX" ASC -- 글번호
	);

-- 후기게시판
ALTER TABLE "review"
	ADD
		CONSTRAINT "PK_review" -- 후기게시판 기본키
		PRIMARY KEY (
			"IDX" -- 글번호
		);
select * from review;
-- 후기게시판
ALTER TABLE "review"
	ADD
		CONSTRAINT "FK_MEMBER_TO_review" -- 회원 -> 후기게시판
		FOREIGN KEY (
			"MIDX" -- 회원번호
		)
		REFERENCES "MEMBER" ( -- 회원
			"MIDX" -- 회원번호
		);

-- 리뷰 시퀀스        
CREATE SEQUENCE SEQ_REVIEW_IDX
START WITH 1
INCREMENT BY 1
NOCACHE;          


-- 리뷰댓글

-- 후기게시판댓글
ALTER TABLE "R_RP"
	DROP CONSTRAINT "FK_review_TO_R_RP"; -- 후기게시판 -> 후기게시판댓글

-- 후기게시판댓글
ALTER TABLE "R_RP"
	DROP CONSTRAINT "FK_MEMBER_TO_R_RP"; -- 회원 -> 후기게시판댓글

-- 후기게시판댓글
ALTER TABLE "R_RP"
	DROP CONSTRAINT "PK_R_RP"; -- 후기게시판댓글 기본키

-- 후기게시판댓글
DROP TABLE "R_RP";

-- 후기게시판댓글
CREATE TABLE "R_RP" (
	"RIDX"    NUMBER(8)      NOT NULL, -- 댓글번호
	"ID"      VARCHAR2(30)   NOT NULL, -- 작성자
	"CONTENT" VARCHAR2(2000) NOT NULL, -- 댓글내용
	"RDATE"   DATE           NOT NULL, -- 작성일
	"IDX"     NUMBER(8)      NOT NULL, -- 글번호
	"MIDX"    NUMBER(8,0)    NOT NULL  -- 회원번호
);

-- 후기게시판댓글 기본키
CREATE UNIQUE INDEX "PK_R_RP"
	ON "R_RP" ( -- 후기게시판댓글
		"RIDX" ASC -- 댓글번호
	);

-- 후기게시판댓글
ALTER TABLE "R_RP"
	ADD
		CONSTRAINT "PK_R_RP" -- 후기게시판댓글 기본키
		PRIMARY KEY (
			"RIDX" -- 댓글번호
		);

-- 후기게시판댓글
ALTER TABLE "R_RP"
	ADD
		CONSTRAINT "FK_review_TO_R_RP" -- 후기게시판 -> 후기게시판댓글
		FOREIGN KEY (
			"IDX" -- 글번호
		)
		REFERENCES "review" ( -- 후기게시판
			"IDX" -- 글번호
		);

-- 후기게시판댓글
ALTER TABLE "R_RP"
	ADD
		CONSTRAINT "FK_MEMBER_TO_R_RP" -- 회원 -> 후기게시판댓글
		FOREIGN KEY (
			"MIDX" -- 회원번호
		)
		REFERENCES "MEMBER" ( -- 회원
			"MIDX" -- 회원번호
		);
        
-- 후기댓글 시퀀스
CREATE SEQUENCE SEQ_R_RP_IDX
START WITH 1
INCREMENT BY 1
NOCACHE;   