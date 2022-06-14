#17sqlite.py
'''

'''
#sqlite를 사용하기 위한 모듈 임포트
import sqlite3

#db연결(최초 실행시 파일이 생성됨)
conn=sqlite3.connect('dbase1')
#연결 후 DB작업을 위해 커서 생성함
curs = conn.cursor()

#curs.execute('drop table people')

''' 
테이블생성
첫실행 이후 이미생성된테이블이라 문제생겨예외처리함
'''

try:
    tblcmd = 'create table people (name char, job char, pay int)'
    curs.execute(tblcmd)
except Exception as e:
    print("테이블 이미생성됨", e)

#레코드 삽입(튜플)
curs.execute('insert into people values (?,?,?)',('이순신','장군',500))

#레코드 삽입(List를 이용한 2개 이상 레코드 삽입)
curs.executemany('insert into people values(?,?,?)',\
             [('강감찬','장군',700), ('홍길동','의적',800)])

#레코드 삽입(for문 이용)
rows = [['곽재우','의병',1100],['유성룡','재상',1200],['임꺽정','의적',1500]]

for row in rows:
    curs.execute('insert into people values(?,?,?)',row)

conn.commit()

#조회(한번에출력)
curs.execute('select * from people')
print(curs.fetchall())
print('-'*20)

#조회(for문)
curs.execute('select * from people')
for row in curs.fetchall():
    print(row)
print('-'*20)

#조회(특정칼럼 for문)
curs.execute('select * from people')
for(name, job, pay) in curs.fetchall():
    print(name,":",job,":",pay)
    
 
#이름이 '강감찬'인 레코드 급여 9999변경
curs.execute("update people set pay='9999' where name='강감찬'")
#curs.execute("update people set pay=%d where name='%s'" % (9990, '강감찬'))

#급여 1200인 레코드 삭제
curs.execute("delete from people where pay='1200'")

curs.execute('select * from people')
print(curs.fetchall())

conn.commit()