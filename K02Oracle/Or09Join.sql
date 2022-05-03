--hr 계정에서 진행

/*
1. inner join (내부조인)
- 가장많이 사용되는 join문
- 테이블간의 연결조건을 모두 만족하는 행 검색 시 사용
- 테이블에 동일한 이름의 컬럼이 있다면 ”테이블명.컬럼명”형태로 기술
  (별칭명.컬럼명으로도 사용가능)
- EquiJoin(등가조인)

//ANSI 표준방식
select
	컬럼1, 컬럼2,......컬럼N
from
	테이블1 inner join 테이블2
on
	테이블1.기본키컬럼=테이블2.외래키(참조키)컬럼    
where
	조건1 and 조건2 or 조건3;


//Oracle 방식
select
	컬럼1, 컬럼2,.....컬럼N
from 
	테이블1, 테이블2
where 
	테이블1.기본키=테이블2.외래키 
		and 조건1 or 조건2 .... 조건N;
*/

/*
사원테이블과 부서테이블을 조인하여 각 직원이
어떤부서에 근무하는지 작성 

결과 : 사원id, 이름1, 이름2, 이메일, 부서번호, 부서명
*/

--1번방식
select 
    employees.employee_id, 
    employees.first_name, 
    employees.last_name, 
    employees.email, 
    -- 두테이블 전부 존재하여 다음과 같이 지정 : ”테이블명.컬럼명”
    employees.department_id, 
    departments.department_name 
from employees inner join departments 
on employees.department_id = departments.department_id
order by employees.employee_id;

--별칭사용함
select 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    e.email, 
    e.department_id, 
    d.department_name 
from employees e inner join departments d
on e.department_id = d.department_id
order by e.employee_id;

-- 여기서 부서명이 없는사람이 1명있어서 106행이 나온다..

/*
2개이상해보기...(여기선 4개테이블이 쓰임)

seattle(시애틀)에 위치한 부서에서 근무하는 직원벙보 출력

출력:
사원명,이메일,부서아이디,부서명,담당업무아이디,담당업무명,근무지역

사원테이블 : 사원명,이메일 , 부서아이디(참조), 담당업무아이디(참조)
부서테이블 : 부서아이디,부서명 , 지역일련번호(참조)
담당업무테이블 : 담당업무아이디,담당업무명, 담당업무아이디(참조)
지역테이블 : 근무지역, 지역일련번호(참조)
*/

select
    e.first_name, e.last_name, e.email, 
    d.department_id, d.department_name, 
    j.job_id, j.job_title, 
    l.city, l.state_province
from employees e 
    inner join departments d
    on e.department_id = d.department_id
    inner join jobs j 
    on e.job_id = j.job_id 
    inner join locations l 
    on d.location_id = l.location_id 
where lower(l.city) ='seattle';
 

--형식2번(오라클전용)
/*
사원테이블과 부서테이블을 조인하여 각 직원이
어떤부서에 근무하는지 작성 

결과 : 사원id, 이름1, 이름2, 이메일, 부서번호, 부서명
*/
select 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    e.email, 
    e.department_id, 
    d.department_name 
from employees e, departments  d
where e.department_id = d.department_id
--and 조건1 or 조건2 ... 조건n
order by e.employee_id;

/*
2개이상해보기...(여기선 4개테이블이 쓰임)

seattle(시애틀)에 위치한 부서에서 근무하는 직원벙보 출력

출력:
사원명,이메일,부서아이디,부서명,담당업무아이디,담당업무명,근무지역
*/

select
    e.first_name, e.last_name, e.email, 
    d.department_id, d.department_name, 
    j.job_id, j.job_title, 
    l.city, l.state_province
from employees e , departments d, jobs j,  locations l 
where (e.department_id = d.department_id 
and e.job_id = j.job_id  
and d.location_id = l.location_id )
and lower(l.city) ='seattle';


/*
2. outer join(외부조인)
- 두테이블에 조건이 정확히 일치하지 않아도 기준이 되는 테이블에서 결과값을 가져오는 join문
- 반드시 어떤테이블을 기준으로 데이터를가져올지 기술해야함
  
//ANSI 표준방식
select
	컬럼1, 컬럼2,......컬럼N
from
	테이블1 
		left[right, full] outer join 테이블2
			on 테이블1.기본키컬럼=테이블2.외래키(참조키)컬럼    
where
	조건1 and 조건2 or 조건3;


//Oracle 방식
select
	컬럼1, 컬럼2......컬럼N
from
	테이블1, 테이블2
where 
	테이블1.기본키=테이블2.외래키(+) 
	and 조건1 or 조건2 ... 조건n;

=> 오라클방식으로 변경시에는 outer join연산자인 
(+)를 where에 붙여준다.
    
 left outer join → 왼쪽테이블 기준
 right outer join → 오른쪽테이블 기준
 full outer join → 양쪽테이블 모두에서 레코드 가져옴
    
*/



/*
전체직원의 사원번호, 이름, 부서아이디, 부서명, 지역을
left outer join
*/
--형식1
select 
 e.employee_id, e.first_name,
 d.department_id, d.department_name,
 l.city
from employees e 
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
    LEFT OUTER JOIN  locations l 
    ON d.location_id = l.location_id;
--매칭되는 레코드가 없으면 null

--형식2
select 
 e.employee_id, e.first_name,
 d.department_id, d.department_name,
 l.city, l.state_province
from employees e , departments d, locations l 
    where
    --(+) : outer join연산자
    e.department_id = d.department_id(+)
    and d.location_id = l.location_id(+);

/*
--  만약 기준이 다를경우 기준이 되는쪽을 왼쪽에 위치시킨다
d.department_id = e.department_id(+)
and l.location_id = d.location_id(+);
*/
    

/*
2007년에 사원조회
부서에 배치되지않은 직원은<부서없음>으로 출력
항목 : 사번,이름,성, 부서명
*/

select 
    e.employee_id, e.first_name, e.last_name, 
    nvl( d.department_name, '<부서없음>') "부서명"
from employees e left outer join departments d 
on e.department_id = d.department_id 
where TO_CHAR(e.hire_date, 'yyyy')='2007';
--where e.hire_date like '07%';

select 
    e.employee_id, e.first_name, e.last_name, 
    nvl( d.department_name, '<부서없음>') "부서명"
from employees e, departments d 
where e.department_id = d.department_id(+) 
and TO_CHAR(e.hire_date, 'yyyy')='2007';


/*
3. self join(셀프조인)

- 하나의 테이블에 있는 컬럼끼리 연결
- 자기자신의 테이블과 조인을 맺는것으로 별칭(Alias)이 
  테이블 구분의 역할을 함
  
select 
	별칭1.컬럼, 별칭2.컬럼 ....
from    
	테이블A 별칭1, 테이블A 별칭2
where
	별칭1.컬럼=별칭2.컬럼 ;
*/

/*
사원테이블에서 각 사원의 매니져 아이디와 이름출력
단, 이름은 first_name과 last_name 하나로 연결
*/

select 
empCleck.employee_id "사원번호", 
empCleck.first_name || ' ' || empCleck.last_name "사원명",
empManager.employee_id "매니져번호", 
empManager.first_name || ' ' || empManager.last_name "매니져명"
from employees empCleck, employees empManager
where empcleck.manager_id = empmanager.employee_id;

/*
self join을 이용하여
"Kimberely / Grant" 사원보다 입사일이 늦은 사원명과 입사일
*/

select  
    empresult.first_name|| '' ||empresult.last_name, 
    empresult.hire_date
from employees empBasic, employees empResult 
where empbasic.hire_date < empResult.hire_date
and empbasic.first_name='Kimberely'
and empbasic.last_name='Grant';

/*
using
join문에서 주로 사용하는 on절을 대체할수 있는 문장
* 두테이블 컬럼명 일치 ,별칭사용 x
*/
select
    first_name,last_name, email, 
    department_id, departments.department_name, 
    job_id, job_title, 
    city, state_province 
from employees 
    inner join departments 
    using(department_id) 
    inner join jobs 
    using(job_id)
    inner join locations  
    using(location_id) 
where lower(city) ='seattle';


/*
 퀴즈] 2005년에 입사한 사원들중 California(STATE_PROVINCE) / 
 South San Francisco(CITY)에서 근무하는 사원들의 정보를 출력하시오.
 단, 표준방식과 using을 사용해서 작성하시오.
 
 출력결과] 사원번호, 이름, 성, 급여, 부서명, 국가코드, 국가명(COUNTRY_NAME)
        급여는 세자리마다 컴마를 표시한다. 
 참고] '국가명'은 countries 테이블에 입력되어있다. 
*/
select 
    employee_id "사원번호", first_name "이름", last_name "성", 
    ltrim(to_char(salary, '999,000')) "급여", 
    department_name "부서명", country_id "국가코드", COUNTRY_NAME "국가명"
from employees 
inner join DEPARTMENTS using(department_id) 
inner join LOCATIONS using(location_id) 
inner join countries using(COUNTRY_ID) 
where to_char(HIRE_DATE, 'yyyy') ='2005' 
and STATE_PROVINCE='California' 
and CITY='South San Francisco';

