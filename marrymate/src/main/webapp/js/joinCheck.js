$(document).ready(function() {
  $('#nickcb').click(function() {
    var nick = $('#nick').val();
    if (nick == '') {
      alert('닉네임을 입력해주세요.');
      return;
    }
    $.ajax({
      url: 'checkNick.do',
      type: 'POST',
      data: {nick: nick},
      success: function(result) {
        if (result == 'true') {
          $('#nickCheck').css('color', 'blue').text('사용 가능한 닉네임입니다.');
        } else {
          $('#nickCheck').css('color', 'red').text('이미 사용 중인 닉네임입니다.');
        }
      }
    });
  });
});

$(document).ready(function() {
  $('#idcb').click(function() {
    var id = $('#id').val();
    if (id == '') {
      alert('아이디를 입력해주세요.');
      return;
    }
    $.ajax({
      url: 'checkId.do',
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

$(document).ready(function() {
  $('#gnamecb').click(function() {
    var gname = $('#gname').val();
    if (gname == '') {
      alert('추천인 아이디를 입력해주세요.');
      return;
    }
    $.ajax({
      url: 'checkGname.do',
      type: 'POST',
      data: { gname: gname },
      success: function(result) {
        if (result == 'true') {
          $('#gnameCheck').css('color', 'blue').text('존재하는 추천인입니다.');
        } else {
          $('#gname').val("");
          $('#gnameCheck').css('color', 'red').text('추천인이 존재하지 않습니다.');
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
    if (reCheckPwd === pwd) {
      rePwdMsg.style.color = "blue";
      rePwdMsg.innerText = "비밀번호가 일치합니다.";
    } else {
      rePwdMsg.style.color = "red";
      rePwdMsg.innerText = "비밀번호가 일치하지 않습니다.";
      return false;
    }
  }
}

window.onload = function() {
  var today = new Date().toISOString().split("T")[0];
  document.getElementById("birthday").setAttribute("max", today);
  document.getElementById("marrydate").setAttribute("min", today);

  var toggleDate = document.getElementById("toggleDate");
  toggleDate.addEventListener("click", togglePut);
};

function togglePut() {
  var datePut = document.getElementById("datePut");
  var marrydate = '<input type="date" name="marrydate" min="' + new Date().toISOString().split("T")[0] + '">';

  if (toggleDate.checked) {
    marrydate = '<input type="hidden" name="marrydate" value="1111-11-11">';
  }

  datePut.innerHTML = marrydate;
}


function allCheckForm() {
  var inputs = document.getElementsByTagName("input");
  var rule_1 = document.getElementsByName("rule_1")[0];
  var rule_2 = document.getElementsByName("rule_2")[0];
  var gender = document.getElementsByName("gender");
  var genderChecked = false;
  
  for (var i = 0; i < gender.length; i++) {
    if (gender[i].checked) {
      genderChecked = true;
      break;
    }
  }
  
  if (!genderChecked) {
    alert("성별을 체크해주셔야합니다.");
    return false;
  }
  
  var pwd = document.getElementById("pwd").value;
  var reCheckPwd = document.getElementById("reCheckPwd").value;

  if (pwd !== reCheckPwd) {
    alert("비밀번호가 일치하지 않습니다.");
    return false;
  }

  if (!checkPwd()) {
    alert("비밀번호가 조건에 맞지 않습니다.");
    return false;
  }
  
  if (!rule_1.checked || !rule_2.checked) {
    alert("필수 약관에 동의해주셔야 서비스를 이용할 수 있습니다.");
    return false;
  }
  
  for (var i = 0; i < inputs.length; i++) {
    if (inputs[i].name !== "gname" && inputs[i].name !== "pname" && inputs[i].value === "") {
      alert("선택 정보를 제외한 필수적인 정보들을 기입해주세요.");
      return false;
    }
  }
  return true;
}