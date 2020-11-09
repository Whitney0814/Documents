// password를 맞추는 프로그램을 개발한다.
// password를 미리 지정한다. (const사용추천)
// prompt 를 password 를 받는다.
// 만약 맞았다면 "로그인 되었습니다!" 출력
// 만약 틀렸다면 "로그인에 실패하였습니다."출력

const ID = "염좌준";
const PASSWORD = "1234";

inputID = prompt("아이디");
inputPassword = prompt("비밀번호");

if(inputID === ID && inputPassword === PASSWORD) {
    alert("로그인 되었습니다!");
}else if(inputID !== ID && inputPassword !== PASSWORD){
    alert("로그인에 실패하였습니다.");
}else if(inputID !== ID){
    alert(`${inputID}` + "이라는 아이디를 찾을 수 없습니다.");
}else if(inputPassword !== PASSWORD){
    alert("비밀번호가 틀렸습니다.");
}

alert(`${typeof inputPassword}, ${typeof PASSWORD}`);

