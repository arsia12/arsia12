-- ȸ��
ALTER TABLE "MEMBER"
	DROP CONSTRAINT "PK_MEMBER"; -- ȸ�� �⺻Ű

-- ȸ��
DROP TABLE "MEMBER";

-- ȸ��
CREATE TABLE "MEMBER" (
	"MIDX"     NUMBER(8,0)        NOT NULL, -- ȸ����ȣ
	"ID"       VARCHAR2(30)       NOT NULL, -- ���̵�
	"PWD"      VARCHAR2(30)       NOT NULL, -- ��й�ȣ
	"NAME"     VARCHAR2(30)       NOT NULL, -- �̸�
	"EMAIL"    VARCHAR2(30)       NOT NULL, -- �̸���
	"POSTCODE" VARCHAR2(100)      NOT NULL, -- �����ȣ
	"ADDR1"    VARCHAR2(100) NOT NULL, -- �ּ�1
	"ADDR2"    VARCHAR2(100) NOT NULL, -- �ּ�2
	"HP"       VARCHAR2(30)       NOT NULL, -- �ڵ�����ȣ
	"DATE"     DATE               NOT NULL, -- ������
	"MILEAGE"  NUMBER(8)          NULL,     -- ���ϸ���
	"MSTATE"   NUMBER(1,0)        NOT NULL  -- ȸ������
);

-- ȸ�� �⺻Ű
CREATE UNIQUE INDEX "PK_MEMBER"
	ON "MEMBER" ( -- ȸ��
		"MIDX" ASC -- ȸ����ȣ
	);

-- ȸ��
ALTER TABLE "MEMBER"
	ADD
		CONSTRAINT "PK_MEMBER" -- ȸ�� �⺻Ű
		PRIMARY KEY (
			"MIDX" -- ȸ����ȣ
		);
        
ALTER TABLE "MEMBER"
    ADD
        CONSTRAINT "UK_MEMBER_ID"
        UNIQUE (
            "ID"
        );
        