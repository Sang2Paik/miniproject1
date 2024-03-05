# 미니프로젝트 - 동네가게

https://github.com/Sang2Paik/miniproject1/assets/147046089/6660c6e9-ab28-433e-82cc-c1724348e791

<hr>

# :clipboard: 목차
### 1. [프로젝트 설명](#movie_camera-프로젝트-설명)
### 2. [개발 기간](#calendar-개발-기간)
### 3. [팀원소개](#family-팀원소개)
### 4. [사용기술](#wrench-사용기술)
### 5. [개선해야할 점](#cry-개선해야할-점)

<hr>

 # :movie_camera: 프로젝트 설명

 1. 기능 개요
  - 현재 위치 기반으로 반경 2km 이내의 소상공인가게를 검색할 수 있습니다.
  - 음식 카테고리별로 가게를 검색할 수 있습니다.
  - 회원가입 및 로그인 기능이 제공됩니다.
  - 사용자는 쿠폰을 발급받고 발급받은 쿠폰을 확인할 수 있습니다.
 2. 기능 상세 설명
  - 위치 기반 검색: 사용자의 현재 위치를 기반으로 반경 2km 이내의 가게를 검색합니다.
  - 음식 카테고리 검색: 음식 카테고리를 선택하여 해당 카테고리의 가게를 검색할 수 있습니다.
  - 회원가입 및 로그인: 사용자는 회원가입을 통해 서비스를 이용할 수 있고, 로그인하여 개인 정보를 관리할 수 있습니다.
  - 쿠폰 시스템 : 관리자는 쿠폰을 발행할 수 있고, 유저/소상공인은 발급받은 쿠폰을 마이페이지에서 확인할 수 있습니다.

  ## <a href="https://github.com/Sang2Paik/miniproject1/">Source Repository</a>

<hr>

# :calendar: 개발 기간
- ` 2024년 1월 22일 (월) ~ 2024년 1월 30일(화) `
- ` 설계 1일 / 개발 6일 `

<hr>

# :family: 팀원소개
  
  ## WEB DESIGN 
  * 최병훈
     * 전체적인 웹 디자인
  
  ## BACK END 
  * 백상희
    * 로그인, 로그아웃, 회원가 기능 구현
    * 지도에 주변 2km 이내의 가게 마커로 표현하기
    * 음식 카테고리별 주변 2km 이내의 소상공인 가게 리스트 10개 출력하는 기능
  * 이영준
    * 소상공인 가게정보 CRUD 기능 구현
    * 가게별 메뉴정보 CRUD 기능 구현
  * 최시환
    * 관리자 페이지 기능 구현 (모든 유저 리스트 관리, 쿠폰 발행 기능 구현)
    * 일반 유저 및 소상공인은 쿠폰 발급 받기 후, 내 쿠폰 보기 기능 구현

<hr>

# :wrench: 사용기술

  #### Front-End 
  <div style="display:inline-block">
    <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white" />
    <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white" />
    <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white" />
    <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=bootstrap&logoColor=white" /> 
  </div>
  
  #### Back-End
  <div style="display:inline-block">
    <img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white" /> 
    <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat&logo=apachetomcat&logoColor=white" /> 
    <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white" />  
  </div>
  
  #### Tools
  <div style="display:inline-block">
    <img src="https://img.shields.io/badge/Elipse-2C2255?style=flat&logo=eclipseide&logoColor=white" /> 
  </div>

<hr>

# :cry: 개선해야할 점

1. Geolocation 을 사용하기 위해서는 HTTPS만 지원이 되기 때문에, ip-api.com를 사용했는데 무료버전이라 정확한 위치를 잡아내지는 못한다.
   그래서, 도메인을 구매해서 geolocation으로 구현할 필요가 있다. 추가적으로 현재 위치 외에도 유저 입장에서 다른 위치를 입력 받을 수 있는 기능도 구현을 해야할 것 같다.
2. 쿠폰을 설계할 때, 신규가입 유저에 대한 부분도 고려를 해야할 필요가 있을 것 같다.
   신규가입 후, 관리자가 빌행한 쿠폰 수가 부족하면 쿠폰이 없다는 메시지가 뜨기 때문에, 이 부분은 개선이 필요하다.
3. 소상공인이 가입을 하는 경우에 메뉴와 상점 정보가 메인 화면에 출력되도록 설계를 정밀하게 하는 것도 필요하다.
   이번에는 시간이 부족해서 오픈 API를 활용하긴 했지만, 좀 더 유동적으로 움직일 수 있도록 해야할 것 같다.
