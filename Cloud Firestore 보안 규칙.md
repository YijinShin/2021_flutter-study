# Cloud Firestore 보안 규칙 

* read
> * get : single document read
> * list : applies queries and collection read requests

* write
> * create : 존재하지 않는 document에 write
> * update  : 존재하는 document에 write 
> * delete : 데이터 삭제 

* 중첩 Match문
> 한 문서에 여러 match문이 연결되어있는 경우, 하나라도 참이면 접근이 허용됨. 

* 인증   
>     if request.auth != null;    
> 로그인 한 사용자가 권한 얻음   

>     if request.auth != null && request.auth.uid == userId;   
> 로그인 한 사용자 + 사용자가 자신의 데이터만 권한 얻음   

>     if resource.data.visibility == 'public';   
> 데이터의 visibility에 따라 권한 부여   

>     if request.resource.data.population > 0   
>        && request.resource.data.name == resource.data.name;   
> 데이터에 조건을 걸고 권한 부여    

