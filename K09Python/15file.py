#15file.py
'''
open():파일 다룰때 사용, 첫번째 인자인 file경로만 필수인자임
형식]
    open(파일경로, mode='', buffering='', encoding='')
    
    mode - 파일 열기모드
    r:읽기
    w:쓰기
    a:추가(마지막부분에 새 내용 추가)
    b:2진모드(바이너리모드) 컴퓨터가 알아볼수 있는 파일생성
    t:텍스트모드(default)사람이 알아볼수 있는형태의 텍스트 파일 생성
'''
#파일생성(없으면 자동생성됨)
print("="*30)
print("새파일01.txt")
f_open = open("새파일01.txt",mode='wt', encoding='utf-8')
for i in range(1, 21):
    data = "%d번째 줄입니다 \n" % i
    f_open.write(data)
f_open.close()

#파일읽기
f_read = open("새파일01.txt",mode='rt', encoding='utf-8')
while True:
    #읽을 내용읽기(한줄)
    line =f_read.readline()
    #읽을내용없으면 빠져나감
    if not line: break
    print(line)
f_read.close()

#기존파일에 내용추가
f_add = open("새파일01.txt",mode='at', encoding='utf-8')
#개행문자없으면 줄바꿈안됨
f_add.write("추가하는 내용입니다")
#리스트를 통해 여러줄 내용입력
f_add.writelines(["줄바꿈은 되나요?\n", "안되면 개행문자 넣어주세여"])
f_add.write("마지막 라인입니다")
f_add.close()

print("="*30)
print("새파일02.txt")
print("="*30)

# 자동으로 파일객체 닫기 및 여러줄 쓰기/읽기

#파일쓰기
with open("새파일02.txt",mode='wt', encoding='utf-8') as myfile:
    for i in range(1,16):
        data = "%d라인 입력 \n" % i
        myfile.write(data)

#파일읽기
with open("새파일02.txt",mode='rt', encoding='utf-8') as myfile:
    line =None
    while  line != '':
        line =myfile.readline()
        print(line.strip('\n'))
 
'''
피클링(pickling)
파이썬 객체를 파일에 저장하는 과정
(복원은 언피클링)
'''      
#피클링을위한 모듈 임포트 
import pickle

#파일에 저장할 내용들...
name='kosmo'
age = 99
address ='서울시 금천구 가산동'
times ={'JAVA':20, 'HTML':2, 'Oracle':10, 'Python':3}

#쓰기모드로 바이너리 파일오픈 (파일없으면 자동생성)
with open('kosmo.p', 'wb') as file:
    #dump() : 데이터 저장
    pickle.dump(name, file)
    pickle.dump(age, file)
    pickle.dump(address, file)
    pickle.dump(times, file)
 
#읽기모드   
with open('kosmo.p', 'rb') as file:
    #load() : 데이터 복원
    name = pickle.load(file)
    age = pickle.load(file)
    address = pickle.load(file)
    times = pickle.load(file)
    print("이름", name)
    print("나이", age)
    print("주소", address)
    print("배당시간", times)
