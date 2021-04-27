### Firebase Athentication

* import 'package:firebase_auth/firebase_auth.dart';
* get FirebaseAuth instance   

>     FirebaseAuth auth = FirebaseAuth.instance();       
> firebase에 연결된 앱이 하나인 경우 이렇게 사용가능   
 
>     FirebaseApp app2 = Firebase.app('SecondaryApp');
>     FirebaseAuth auth = FirebaseAuth.instanceFor(app: SecondaryApp);   
> firebase에 연결된 앱이 여러개일 경우 직접 앱을 지정해서 사용

* Authentication state   
>     FirebaseAuth.instance.authStateChanges().listen(User user)   
> 로그인, 로그 아웃 등 사용자의 인증상태 반환 (로그인 되어있으면 User 객체 반환, 아니면 null 반환)   
     
>     FirebaseAuth.instance.userChanges().listen(User user)     
> 인증상태 변경, ID 변경 등 사용자의 변경이벤트가 필요한 경우 userChanges() 사용하기 
> 이 스트림은 reload() 필요없이 User class에 대한 realtime update를 제공한다.

* Registration   
>     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
>      email: "00000",
>      password: "0000"
>     );   
> createUserWithEmailAndPassword() 에 이메일, pw 전달. (fb에서 선택한 로그인 방법에 따라 parameter달라짐.)
  
* Sign-in   
>     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
>      email: "00000",
>      password: "0000"
>     );   
> signInWithEmailAndPassword() 에 이메일, pw 전달. (fb에서 선택한 로그인 방법에 따라 parameter달라짐.)

* 현재 로그인한 사용자 가져오기   
>     User user = FirebaseAuth.instance.currentUser       

* User 프로필 가져오기 
>     var name, email, photoUrl, uid, emailVerified;
>     User user = FirebaseAuth.instance.currentUser 
>     name = user.displayName;
>     email = user.email;
>     photoUrl = user.photoURL;
>     emailVericied = user.emailVerified;
>     uid = user.uid;   
 
* 사용자에게 확인 메일 보내기     
>     if(!user.emailVerified){
>       await user.sendEmailVerificaton();
>     }       
> sendEmailVerification(): User class에서 제공. 사용자의 메일 주소로 '주소확인메일'을 보낼 수 있다.   

* 사용자 프로필 업데이트   
>     User user = FirebaseAuth.instance.currentUser 
>     user.updateProfile(
>       {
>         displayName : "new name",
>       }
>     ).then(funtion() {
>       //update successful
>     }).catch(fuction(error){
>       //error 
>     });   
> updateProfil() 함수 사용

* 사용자 이메일 주소 설정   
>     User user = FirebaseAuth.instance.currentUser 
>     user.updateEmail(
>      "new email"
>     ).then(funtion() {
>       //update successful
>     }).catch(fuction(error){
>       //error 
>     });   
> updateEmail() 함수 사용

* 사용자 password 주소 설정   
>     User user = FirebaseAuth.instance.currentUser 
>     user.updatePassword(
>      "new password"
>     ).then(funtion() {
>       //update successful
>     }).catch(fuction(error){
>       //error 
>     });   
> updatePassword() 함수 사용

* 사용자 password 재설정   
>     FirebaseAuth auth = FirebaseAuth.instance();
>     var email = "user email";
>     auth.sendPasswordResetEmail(
>       email
>     ).then(funtion() {
>       //update successful
>     }).catch(fuction(error){
>       //error 
>     });   
> sendPasswordResetEmail() 함수 사용


* 사용자 delete   
>     User user = FirebaseAuth.instance.currentUser 
>     user.delete().then(funtion() 
>     {
>       //update successful
>     }).catch(fuction(error){
>       //error 
>     });   
> delete() 함수 사용

