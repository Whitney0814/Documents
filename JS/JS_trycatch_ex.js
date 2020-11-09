/*
let json = '{"name":"John", "age": 30}'; // data from the server

let user = JSON.parse(json);   // 텍스트 표현을 JS 객체로 변환

// 이제 사용자는 문자열의 속성을 가진 객체입니다.
alert(user.name); // John
alert(user.age);  // 30
*/
let json = "{ bad json }";

try {
    let user = JSON.parse(json);    // when an error occurs...
    alert( user.name );     // doesn't work
} catch (e) {
    // ...the execution jumps here
    alert("Our apologies, the data has errors, we'll try to request it one more time.");
    alert( e.name );
    alert( e.message );
}