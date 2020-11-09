// 블랙잭 게임
//
// 1.  처음에 prompt 로 숫자를 받습니다.
// 2.  그 숫자를 총 숫자에 더하고
//3-1. 만약 총 숫자가 21이 정확하게 되면 승리하였습니다! 라고 띄웁니다.
//3-2. 만약 총 숫자가 21보다 적으면 다시 1번부터 반복합니다.
//3-3. 만약 총 숫자가 21보다 크면 실패하셨습니다! 를 출력합니다.(그리고 종료)

// 주의사항
// 21이란 숫자를 그냥 쓰지 마세요 <- 매직넘버 주의
// for, while 자유입니다.
// 반복을 사용해셔서 처리해주세요.

const NUMBER = 21;
let number = 0;
while(true){
    number += Number(prompt("숫자입력"));
    alert(number);
    if(number >= 21){
        if(number === NUMBER){
            alert("승리하였습니다!");
        }else if(number > NUMBER){
            alert("실패하셨습니다!");
            break;
        }else{
            alert("1번부터 반복합니다.");
            continue;
        }
        number = 0;
    }
}

alert(`${typeof NUMBER}, ${typeof number}`);