# 소비분석을 통한 카드 추천 서비스

[프로젝트 홈페이지](https://koposoftware.github.io/2021_3_jykim/)

# 1. 프로젝트 개요
> ### 내 카드의 월 평균 혜택은?
<img src="https://user-images.githubusercontent.com/25000075/135796165-60122e12-8965-4ff1-b720-89e7f9d061a2.png" width="500px;"/>

본인의 소비 패턴을 고려하여 신중히 신용카드를 선택해도, **이전 달 실적, 할인 한도, 최소 결제 금액 조건** 등 카드 혜택을 받기 위한 조건이 까다롭습니다. <br>
이와 같은 이유로 많은 사람들이 본인이 소유한 카드의 정확한 혜택이 무엇인지 잘 파악하지 못하고 있으며, **'피킹률'** 이라는 새로운 개념을 만들어내며 고효율의 카드를 찾으려는 **체크슈머**가 늘어나고 있습니다.<br> 
이에 따라 개인의 소비 패턴을 기반으로 한 맞춤 카드 추천 서비스를 기획하게 되었습니다.



# 2. 프로젝트 제안서
   <img src="https://user-images.githubusercontent.com/25000075/135797532-1eebfccb-1db2-427e-8c96-387cb149eca2.png"/><br>
   [발표자료](./Document/제안서.pdf)<br>
### 시스템 아키텍처
 <img src="https://user-images.githubusercontent.com/25000075/135855904-b61371bd-eebc-4d7a-8be0-87af4bc95bf1.png" width="700px;"/><br>

### 서비스 흐름도
 <img src="https://user-images.githubusercontent.com/25000075/135800656-daaced7d-f48d-4f3c-8b40-5cf1d4e9905a.png" width="700px;"/><br>


# 3. 프로젝트 결과
## 주요 기능
### 일반 고객
   - 신용카드 Top10 추천<br>
<img src="https://user-images.githubusercontent.com/25000075/135797824-7444963d-d2bc-4f80-b764-5a8e0ad5ac5d.PNG" width="700px;"/><br>
   
   - 멀티 카드 조합 Top3 추천<br>
   > **멀티카드란?** <br> 
   > 올해 하나카드에서 새롭게 출시한 카드로, **하나의 카드에 여러 장의 모바일 카드를 넣어** 결제 시 돌려가며 사용할 수 있는 카드. <br>
   > 다양한 업종에 다양한 혜택을 선택적으로 적용할 수 있기에, 고객의 3개월 치 소비 패턴을 기반으로 **어떤 멀티카드 조합을 사용했을 때 가장 큰 혜택을 얻을 수 있는지** 추천해주는 기능  
   
<img src="https://user-images.githubusercontent.com/25000075/135798124-57bafa55-1d77-49ea-8876-c659f5b2c4e4.PNG" width="400px;"/><br>
   
   - 카드 찜<br>
<img src="https://user-images.githubusercontent.com/25000075/135798155-e089804a-ba99-4b94-948b-b630489dc915.png" width="300px;"/><br>
   
   - 카드 비교<br>
<img src="https://user-images.githubusercontent.com/25000075/135798174-3c7f202c-23b3-4041-a364-b5d7cc7dddd7.PNG" width="300px;"/><br>
   
   
### 관리자
   - 마케팅 타겟 추출, 문자 전송<br>
   <img src="https://user-images.githubusercontent.com/25000075/135798435-cb820260-1e1b-450b-84a1-24f8eafb9cc8.png" width="700px;"/><br>

## 발표 ppt 
   <img src="https://user-images.githubusercontent.com/25000075/135951304-cca327ec-ec1c-46cc-ab22-b356e81e0a7f.PNG"/><br>
   [발표자료](./Document/최종발표.pdf)<br>
   
## 시연 동영상 
   <a href="https://youtu.be/2f_1mYYGSzg">
      <img width="700px;" src="https://user-images.githubusercontent.com/25000075/135980889-8cd025fb-5f1b-4dbd-a77d-39b9df868633.png"/><br>
   </a>

# 4. 본인 소개
|항목|내용|.|
|----|----|----|
|이름|김지윤|<img src="https://user-images.githubusercontent.com/25000075/135798880-1d033fa8-a97b-4877-8993-165f931e6ae5.png" width="150px;"/>|
|연락처|kjy951207(@)naver.com|
|skill set|Frontend - HTML, CSS, Javascript, Bootstrap, jQuery|
|         |Backend - Java, Spring, Oracle|
|자격증|정보처리기사, SQLD|
|수상|폴리텍 창업경진대회 - 입선<br> 삼성청년SW아카데미 - 종합 성적우수상, 프로젝트 우수상|
|교육 이수사항|삼성청년SW 아카데미 - 2020.01 ~ 2020.12|


# 5. 기타

## 사용 기술
### 1. 대용량 데이터 처리
 - index 설정
 - 중간 집계 테이블 
 > 고객별 월간, 업종별 소비 합계 저장
 - Stored Procedure 기반 소비 분석 모듈 구현
 - Redis Caching 처리
 
### 2. AWS 클라우드 인스턴스 활용
 - EC2 인스턴스 - Spring 프로젝트 배포
 - RDS 인스턴스 - Oracle

   
 
