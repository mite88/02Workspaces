#18mysql01.py
import pymysql

conn = pymysql.connect(host='locathost', user='kosmo_user',
                       password='1234', db='kosmo_db', charset='utf-8')

curs = conn.cursor()

try:
    sql='select * from board'
    curs.execute(sql)
    
    rows = curs.fetchall()
    print(rows)
    
    print('출력1', '-'*40)
    for row in rows:
        print(row)
    
    print('출력2', '-'*40)
    for row in rows:
        print(row[0], row[1], row[2], end=' ')
        pdate = row[3]
        id = row[4]
        vcnt = row[5]
        print("%s, %s, %s"%(pdate, id, vcnt))
        
    print('출력3', '-'*40)
    sql = sql+" where title like '%{0}%' ".format(input('검색어입력:'))
    curs.execute(sql)
    rows = curs.fetchall()
    print(rows)
    
except Exception as e:
    print("쿼리 실행 오류", e)
     
print('-'*40)
conn.close()
print('자원반납')   