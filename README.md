# 미니프로젝트 - 동네가게

<img src="">

<hr>

# :clipboard: 목차
### 1. [프로젝트 설명](#movie_camera-프로젝트-설명)
### 2. [개발 기간](#calendar-개발-기간)
### 3. [팀원소개](#family-팀원소개)
### 4. [사용기술](#wrench-사용기술)

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


----
이전 커뮤니케이션 기록
----


최병훈 : 2024.01.31 AM 11:44 디자인수정 최종파일
- header.jsp
- assets > css > style.css
- assets > css > font210.css
- assets > js > font210.js
- seller / seller_menu_popup.jsp
- seller / seller_page.jsp
- seller / seller_menu_view.jsp
- seller / seller_detail.jsp
- seller / seller_insert_form.jsp
변경해주세요~~
 
최병훈 : 2024.01.29 업데이트 중
- assets > img > cate_market.png (이미지만 교체 전통시장 -> 식료품) 

최병훈 : 2024.01.29 PM 18:10 업데이트 목록

---- seller 폴더
- seller_detail.jsp
- seller_insert_form.jsp
- seller_menu.jsp
- seller_menu_fe.jsp
- seller_menu_modify_form.jsp
- seller_menu_popup.jsp
- seller_menu_reg_form.jsp
- seller_menu_view.jsp
- seller_modify_form.jsp
- seller_page.jsp
  

최병훈 : 2024.01.29 PM 03:49 업데이트 목록
= 오늘 오전 요청파일 =

---- admin 폴더생성
- admin_page.jsp
- admin_coupon_modify_ajax.jsp
- admin_coupon_update_form.jsp
- admin_user_form_ajax.jsp
- user_update_form.jsp

---- member 폴더생성
- login.jsp
- modify_form.jsp
- mypage.jsp
- signup.jsp

---- 최상위 수정파일
- header.jsp
- index.jsp
- navi.jsp
- navi_sm.jsp

---- assets 폴더생성
- zip으로 압축해서 올려놨어요



================================================  

최병훈 : 2024.01.26 PM 08:05
- seller 폴더생성
- seller_detail.jsp - 상점소개 페이지
- seller_insert_form.jsp
- seller_menu.jsp - 상점메뉴정보 페이지
- seller_menu_popup.jsp
- seller_menu_reg_form.jsp
- seller_menu_view.jsp
- seller_modify_form.jsp
- seller_page_original.jsp
※ assest/css/style.css 업데이트 필요

최병훈 : 2024.01.25 PM 04:52 
- seller / menu_intro.jsp 수정
- seller / menu_detail.jsp 등록
- assest/css/style.css 업데이트 필요

최병훈 : 2024.01.25 PM 12:52 
- member / login.jsp 수정
- member / signup.jsp 수정
- assest/css/form.css 추가등록
- assest/css/style.css 업데이트 필요
- navi_sm.jsp 추가등록 login / signup / admin 등 특정페이지 에서만 사용예정

최병훈 : 2024.01.25 AM 08:25
- navi.jsp 수정 (link, class 변경)- assets img폴더(img안에 하위폴더 제거함), css폴더 새로받으세요.
- navi.jsp (category 메뉴부분 alt="숫자로 변경" : 10:05
- index.jsp 수정 (link, img, class 변경) 08:43
- header.jsp 수정 (경로) 08:50
- footer.jsp 수정 (경로) 08:56
 
  
백상희: 2024.01.24 
- navi.jsp 수정
- login.jsp 수정
- signup.jsp 수정
--------------------------------------------------------------------------------

- 최병훈 : 2024.01.24 AM 09:30 오늘할일 <br>
 : AdminPage(약식) / login.jsp / signup.jsp / menu_detail.jsp / 발표자료 초안제작
----------------------------------------
2024.01.24 AM 04:00 ~ <br>
- .1.24 폴더구조변경은 확정이 아니며 사본입니다 원본은 기존 root에 있어요. 
- 폴더변경된 구조로 진행할지 하던대로 할지 정하고, 하던대로 가자~ 하면 
- 추가생성한 폴더는 삭제하면 됩니당~~ 제가 내용수정한 파일은 jsp, html 링크만.
- 다음 프로젝트할땐 폴더구조(SiteMap) 기본틀은 먼저 정하고 하도록 하지요~ 변동사항 줄일 수 있게


최시환
- 2024.01.23 PM 11:50
coupon VO,DAO 및 root폴더 하위에 필요 임시 coupon jsp생성 , jps로 임시 관리자버튼 만들어서 coupon INSERT기능 및 삭제버튼 구현
추후에 coupon CRUD 및 관리자 coupon 추가할 예정
login 기능 , 회원가입 기능 경로 연결 잘못되어 있어서 경로 설정(+회원가입은 test_signup.jsp 없길래 sighup.jsp로 설정)

백상희
- 2024.01.23 PM 10:09 navi.jsp 수정
- 2024.01.23 PM 10:09 login.html  수정
- 2024.01.23 PM 10:09 signup.html  회원가입에 대한 폼 부분 수정
- 2024.01.23 PM 10:09 memberVo, action에 대한 파일 업로드

최병훈 
- 2024.01.23 PM 05:43 menu_intro.jsp 파일추가 (assets/img/brand/ 음식사진,타이틀이미지 추가 )
- 2024.01.23 PM 04:05 nav.jsp 네비게이션 바 2중으로 나와서 파일에 직접 수정 - 최병훈
- 2024.01.23 AM 11:15 - index.html은 사용하지 않아 삭제 - 최병훈
index.jsp가 메인 파일이에요~

# 2024.01.23 AM 05:34 File Update

index.jsp로 변경 (UI수정, 지저분한 코드정리, incrude 방식으로 적용)
- header.jsp
- navi.jsp
- footer.jsp

% asset 폴더 다시 받으세욥. CSS, img 수정

- signup.html 수정 (DB col name 맞춤) - jsp로 변경예정
- index.html 수정 (보관용)

----------------------------------------------------------
# miniproject1

첫번째 미니프로젝트 2024.01.22 ~ 01. 30 

