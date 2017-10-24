-- 회원
ALTER TABLE "MEMBER"
	DROP CONSTRAINT "PK_MEMBER"; -- 회원 기본키

-- 회원
DROP TABLE "MEMBER";

-- 회원
CREATE TABLE "MEMBER" (
	"MIDX"     NUMBER(8,0)        NOT NULL, -- 회원번호
	"ID"       VARCHAR2(30)       NOT NULL, -- 아이디
	"PWD"      VARCHAR2(30)       NOT NULL, -- 비밀번호
	"NAME"     VARCHAR2(30)       NOT NULL, -- 이름
	"EMAIL"    VARCHAR2(30)       NOT NULL, -- 이메일
	"POSTCODE" VARCHAR2(100)      NOT NULL, -- 우편번호
	"ADDR1"    VARCHAR2(100) NOT NULL, -- 주소1
	"ADDR2"    VARCHAR2(100) NOT NULL, -- 주소2
	"HP"       VARCHAR2(30)       NOT NULL, -- 핸드폰번호
	"DATE"     DATE               NOT NULL, -- 가입일
	"MILEAGE"  NUMBER(8)          NULL,     -- 마일리지
	"MSTATE"   NUMBER(1,0)        NOT NULL  -- 회원상태
);

-- 회원 기본키
CREATE UNIQUE INDEX "PK_MEMBER"
	ON "MEMBER" ( -- 회원
		"MIDX" ASC -- 회원번호
	);

-- 회원
ALTER TABLE "MEMBER"
	ADD
		CONSTRAINT "PK_MEMBER" -- 회원 기본키
		PRIMARY KEY (
			"MIDX" -- 회원번호
		);
        
ALTER TABLE "MEMBER"
    ADD
        CONSTRAINT "UK_MEMBER_ID"
        UNIQUE (
            "ID"
        );
        