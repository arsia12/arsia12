ALTER TABLE review
	DROP CONSTRAINT "FK_MEMBER_TO_review"; -- ȸ�� -> �ı�Խ���

-- �ı�Խ���
ALTER TABLE review
	DROP CONSTRAINT "PK_review"; -- �ı�Խ��� �⺻Ű

-- �ı�Խ���
DROP TABLE review;

-- �ı�Խ���
CREATE TABLE "review" (
	"IDX"     NUMBER(8)      NOT NULL, -- �۹�ȣ
	"ID"      VARCHAR2(30)   NOT NULL, -- �ۼ���
	"SUBJECT" VARCHAR2(200)  NOT NULL, -- ������
	"CONTENT" VARCHAR2(2000) NOT NULL, -- �۳���
    "FILENAME1" VARCHAR2(100) NULL, -- ���ϸ�1
	"FILENAME2" VARCHAR2(100) NULL, -- ���ϸ�2
	"FILENAME3" VARCHAR2(100) NULL, -- ���ϸ�3
	"FILENAME4" VARCHAR2(100) NULL, -- ���ϸ�4
	"WDATE"   DATE           NOT NULL, -- �ۼ���
	"READNUM" NUMBER(8)      NOT NULL, -- ��ȸ��
	"USEYN"   VARCHAR2(2)    NOT NULL, -- ���
	"MIDX"    NUMBER(8,0)    NOT NULL  -- ȸ����ȣ
);


-- �ı�Խ��� �⺻Ű
CREATE UNIQUE INDEX "PK_review"
	ON "review" ( -- �ı�Խ���
		"IDX" ASC -- �۹�ȣ
	);

-- �ı�Խ���
ALTER TABLE "review"
	ADD
		CONSTRAINT "PK_review" -- �ı�Խ��� �⺻Ű
		PRIMARY KEY (
			"IDX" -- �۹�ȣ
		);
select * from review;
-- �ı�Խ���
ALTER TABLE "review"
	ADD
		CONSTRAINT "FK_MEMBER_TO_review" -- ȸ�� -> �ı�Խ���
		FOREIGN KEY (
			"MIDX" -- ȸ����ȣ
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MIDX" -- ȸ����ȣ
		);

-- ���� ������        
CREATE SEQUENCE SEQ_REVIEW_IDX
START WITH 1
INCREMENT BY 1
NOCACHE;          


-- ������

-- �ı�Խ��Ǵ��
ALTER TABLE "R_RP"
	DROP CONSTRAINT "FK_review_TO_R_RP"; -- �ı�Խ��� -> �ı�Խ��Ǵ��

-- �ı�Խ��Ǵ��
ALTER TABLE "R_RP"
	DROP CONSTRAINT "FK_MEMBER_TO_R_RP"; -- ȸ�� -> �ı�Խ��Ǵ��

-- �ı�Խ��Ǵ��
ALTER TABLE "R_RP"
	DROP CONSTRAINT "PK_R_RP"; -- �ı�Խ��Ǵ�� �⺻Ű

-- �ı�Խ��Ǵ��
DROP TABLE "R_RP";

-- �ı�Խ��Ǵ��
CREATE TABLE "R_RP" (
	"RIDX"    NUMBER(8)      NOT NULL, -- ��۹�ȣ
	"ID"      VARCHAR2(30)   NOT NULL, -- �ۼ���
	"CONTENT" VARCHAR2(2000) NOT NULL, -- ��۳���
	"RDATE"   DATE           NOT NULL, -- �ۼ���
	"IDX"     NUMBER(8)      NOT NULL, -- �۹�ȣ
	"MIDX"    NUMBER(8,0)    NOT NULL  -- ȸ����ȣ
);

-- �ı�Խ��Ǵ�� �⺻Ű
CREATE UNIQUE INDEX "PK_R_RP"
	ON "R_RP" ( -- �ı�Խ��Ǵ��
		"RIDX" ASC -- ��۹�ȣ
	);

-- �ı�Խ��Ǵ��
ALTER TABLE "R_RP"
	ADD
		CONSTRAINT "PK_R_RP" -- �ı�Խ��Ǵ�� �⺻Ű
		PRIMARY KEY (
			"RIDX" -- ��۹�ȣ
		);

-- �ı�Խ��Ǵ��
ALTER TABLE "R_RP"
	ADD
		CONSTRAINT "FK_review_TO_R_RP" -- �ı�Խ��� -> �ı�Խ��Ǵ��
		FOREIGN KEY (
			"IDX" -- �۹�ȣ
		)
		REFERENCES "review" ( -- �ı�Խ���
			"IDX" -- �۹�ȣ
		);

-- �ı�Խ��Ǵ��
ALTER TABLE "R_RP"
	ADD
		CONSTRAINT "FK_MEMBER_TO_R_RP" -- ȸ�� -> �ı�Խ��Ǵ��
		FOREIGN KEY (
			"MIDX" -- ȸ����ȣ
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MIDX" -- ȸ����ȣ
		);
        
-- �ı��� ������
CREATE SEQUENCE SEQ_R_RP_IDX
START WITH 1
INCREMENT BY 1
NOCACHE;   