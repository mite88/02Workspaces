--상품코드관리 : sh_product_code
create TABLE sh_product_code (
    p_code number(6) PRIMARY KEY,
    category_name varchar2(30)
);

--상품관리 : sh_goods

create TABLE sh_goods (
    g_idx number(6) PRIMARY KEY,
    goods_name varchar2(50),
    goods_price number,
    regidate date,
    p_code number(6) CONSTRAINT sh_product_code_fk
    REFERENCES sh_product_code(p_code)
);

-- 상품 로그 관리 : sh_goods_log
create TABLE sh_goods_log(
    log_idx number(6) PRIMARY KEY,
    goods_name varchar2(50),
    goods_idx number(6),
    p_action varchar2(20),
    log_date date,
    constraint check_log check(p_action in('Insert','Delete'))
);



--시퀀스 생성
create SEQUENCE seq_total_idx 
    INCREMENT by 1 
    START WITH 1 
    MINVALUE 1
    NOMAXVALUE 
    NoCycle  
    nocache;

--삽입
INSERT into sh_product_code values(seq_total_idx.nextval, '가전');   
INSERT into sh_product_code values(seq_total_idx.nextval, '도서');
INSERT into sh_product_code values(seq_total_idx.nextval, '의류 ');

INSERT into sh_goods values( seq_total_idx.nextval,'냉장고',90000, sysdate, 1 );  
INSERT into sh_goods values( seq_total_idx.nextval,'세탁기',150000, sysdate, 1 ); 
INSERT into sh_goods values( seq_total_idx.nextval,'사피엔스',20000, sysdate, 2 );
INSERT into sh_goods values( seq_total_idx.nextval,'총균쇠 ',31500, sysdate, 2 );
INSERT into sh_goods values( seq_total_idx.nextval,'롱패딩 ',29800, sysdate, 3 );
INSERT into sh_goods values( seq_total_idx.nextval,'레깅스 ',15000, sysdate, 3 );


--프로시져 및 트리거 생성용
set serveroutput on;

--수정
create or replace PROCEDURE ShopUpdateGoods(
    shop_goods_name in varchar2,
    shop_goods_price in number,
    shop_p_code in number,
    shop_g_idx in number,
    shop_g_result out number 
)
is
begin
    update sh_goods set 
    goods_name = shop_goods_name, 
    goods_price = shop_goods_price, 
    p_code = shop_p_code, 
    g_idx = shop_g_idx 
    where g_idx = shop_g_idx;
    
    if SQL%notfound then
     shop_g_result :=0;
    else
        shop_g_result :=1;
    end if;
    
    commit;
end;
/

select * from sh_goods where g_idx=200001;

 update sh_goods set g_idx = shop_g_idx
    where g_idx = shop_g_idx;


--삭제
create or replace PROCEDURE ShopDeleteGoods(
    shop_g_idx in number,
    shop_g_result out number 
)
is
begin
    delete from sh_goods where g_idx = shop_g_idx;
    
    if SQL%notfound then
     shop_g_result := 0;
    else
        shop_g_result := 1;
    end if;
    
    commit;
end;
/

select g_idx, goods_name, to_char(goods_price, '999,000'), regidate, p_code 
from sh_goods;

commit;

--트리거
create or replace trigger shop_log_trigger 
    before 
    Insert or delete 
    on sh_goods
    for each row
begin 

    if Inserting then 
        INSERT INTO sh_goods_log (
            log_idx,
            goods_name,
            goods_idx,
            p_action,
            log_date
        )VALUES 
        (seq_total_idx.nextval, 
        :new.goods_name, 
        :new.g_idx, 
        'Insert', 
        sysdate);
    elsif DELETING then 
     INSERT INTO sh_goods_log (
            log_idx,
            goods_name,
            goods_idx,
            p_action,
            log_date
        )VALUES 
        (seq_total_idx.nextval, 
        :old.goods_name, 
        :old.g_idx, 
        'Delete', 
        sysdate);
    end if;
    
end;
/


insert into sh_goods values (seq_total_idx.nextval, 'test' ,12000 ,
SYSDATE, 2);

DELETE FROM sh_goods WHERE g_idx=44;
