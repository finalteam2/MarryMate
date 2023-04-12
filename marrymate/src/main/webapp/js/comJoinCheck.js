$(document).ready(function() {
  $('#idcb').click(function() {
    var id = $('#id').val();
    if (id == '') {
      alert('아이디를 입력해주세요.');
      return;
    }
    $.ajax({
      url: 'comIdCheck.do',
      type: 'POST',
      data: {id: id},
      success: function(result) {
        if (result == 'true') {
          $('#idCheck').css('color', 'blue').text('사용 가능한 아이디입니다.');
        } else {
          $('#idCheck').css('color', 'red').text('이미 사용 중인 아이디입니다.');
        }
      }
    });
  });
});

function checkPwd() {
  var pwd = document.getElementById("pwd").value;
  var reCheckPwd = document.getElementById("reCheckPwd").value;
  var uppercaseRegex = /[A-Z]/;
  var specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;
  var pwdMsg = document.getElementById("pwdMsg");
  var rePwdMsg = document.getElementById("rePwdMsg");

  if (pwd.length < 8) {
    pwdMsg.style.color = "red";
    pwdMsg.innerText = "비밀번호는 8자 이상이어야 합니다.";
    rePwdMsg.innerText = "";
    return false;
  } else if (!uppercaseRegex.test(pwd)) {
    pwdMsg.style.color = "red";
    pwdMsg.innerText = "비밀번호에 대문자가 적어도 하나 이상 포함되어야 합니다.";
    rePwdMsg.innerText = "";
    return false;
  } else if (!specialCharRegex.test(pwd)) {
    pwdMsg.style.color = "red";
    pwdMsg.innerText = "비밀번호에 특수문자가 적어도 하나 이상 포함되어야 합니다.";
    rePwdMsg.innerText = "";
    return false;
  } else {
    pwdMsg.style.color = "blue";
    pwdMsg.innerText = "조건이 만족되는 비밀번호입니다.";
    if (reCheckPwd === "") {
      rePwdMsg.innerText = "비밀번호 확인을 입력해주세요.";
      rePwdMsg.style.color = "red";
      return false;
    } else if (pwd === reCheckPwd) {
      rePwdMsg.style.color = "blue";
      rePwdMsg.innerText = "비밀번호가 일치합니다.";
      return true;
    } else {
      rePwdMsg.style.color = "red";
      rePwdMsg.innerText = "비밀번호가 일치하지 않습니다.";
      return false;
    }
  }
}


function allCheckForm() {
  var inputs = document.getElementsByTagName("input");
  var payInput = document.getElementsByName("pay")[0];
  var selectedRadio = false; // 선택된 라디오 버튼이 있는지를 나타내는 변수

  for (var i = 0; i < inputs.length; i++) {
    if (inputs[i].name === "kind" && inputs[i].checked) {
      selectedRadio = true;
      break;
    }
    if (inputs[i].name !== "curl" && inputs[i].type !== "file" && inputs[i].value === "") {
      alert("선택 정보를 제외한 필수적인 정보들을 기입해주세요.");
      return false;
    }
  }
  
  if (!selectedRadio) {
    alert("업종을 선택해주세요.");
    return false;
  }
  
  if ($('#idCheck').text() !== '사용 가능한 아이디입니다.') {
    alert("아이디 중복 확인을 해야합니다.");
    return false;
  }
  
  if (!checkPwd()) {
  alert("비밀번호가 조건에 맞지 않습니다.");
  return false;
  }
  
  if (payInput && (payInput.value.trim() === "" || isNaN(payInput.value.trim()))) {
    alert("상품 가격을 숫자로 입력해주세요.");
    return false;
  }
  
  return true;
}