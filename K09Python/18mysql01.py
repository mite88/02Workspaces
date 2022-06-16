'''
파이썬에서는 MySQL(MariaDB)를 사용하기 위해서 PyMySQL 모듈을 설치해야한다.
c:> pip3 install pymysql 
'''
# 모듈 임포트
import pymysql 

#MariaDB 연결
conn = pymysql.connect(host='localhost', user='kosmo_user',
            password='1234', db='kosmo_db', charset='utf8')
'''
    , cursorclass=pymysql.cursors.DictCursor
    => 위 설정이 없는 경우에는 레코드를 튜플로 출력한다. 
    해당 설정을 통해 딕셔너리로 출력할 수 있다. 
    
    만약 중복설치되어 기본포트인 3306을 사용할 수 없는 상태라면
    connect() 함수를 통해 연결시 port=0000 과 같이 항목을 추가한다. 
    포트번호는 문자열이 아닌 숫자(int)로 기술해야 한다.
'''
#커서 생성
curs = conn.cursor()

try:
    sql = "SELECT * FROM board"
    curs.execute(sql)
  
    # select한 모든 레코드 인출. 반복문 없이 전체를 출력한다.
    rows = curs.fetchall()
    print(rows)

    #행(레코드)단위로 출력한다. 
    print('출력1', '-'*40)
    for row in rows:
        print(row)

    #행 단위로 출력하되 각 컬럼의 인덱스를 지정하여 출력한다. 
    print('출력2', '-'*40)
    for row in rows:
        print(row[0], row[1], row[2], end=" ")
        pdate = row[3]
        id = row[4]
        vcnt = row[5]
        print("%s, %s, %s" % (pdate, id, vcnt))
    
    
    # format() 함수를 통해 쿼리문에 사용자가 입력한 검색어를 추가한다. 
    print('출력3', '-'*40)
    sql = sql + " WHERE title like '%{0}%' ".format(input('검색어입력:'))
    curs.execute(sql)
    rows = curs.fetchall()
    print(rows)
except Exception as e:
    print("쿼리 실행시 오류발생", e)

print('-'*40)
conn.close()
print('자원반납')
