import bs4
from requests import request


import requests
from bs4 import BeautifulSoup

#크롤링할 웹사이트 접속
url="https://kin.naver.com/search/list.naver?query=%ED%8C%8C%EC%9D%B4%EC%8D%AC"
#접속을 위해 requests모듈 사용
response = requests.get(url)

#접속성공시...
if response.status_code == 200:
    html = response.text
    soup = BeautifulSoup(html, 'html.parser')
    
    #셀렉터로 추출(크롬)
    title1_1 = soup.select_one('#s_content > div.section > ul > li:nth-child(1) > dl > dt')
    #print('추출1_1:', title1_1)
    #셀렉터로 추출(파이어폭스)
    title1_2 = soup.select_one('basic1 > li:nth-child(1) > dl:nth-child(2) > dt:nth-child(1)')
    #print('추출1_2:', title1_2)
    
    text = title1_1.get_text()
    print('추출2:', text)
    
    ul = soup.select_one('ul.basic1');
    print('추출3:', ul)

    print('추출4')
    titles2 = ul.select('li>dl>dt>a')
    for tit in titles2:
        print(tit.get_text()) 
#접속실패시 ...
else:
    print(response.status_code)   