var formulaInput = document.getElementById("formula-input");
var calcHistDiv = document.getElementById("calc-history");

formulaInput.addEventListener("keyup", function (e) {
    if (e.code === "Enter")
        calculate();
})

function calculate() {

    //사칙연산 확인
    var fm = formulaInput.value;
    var formulaRegex = /^\d+(.\d+)?[+\-*/]{1}\d+(.\d+)?$/;
    var formulaValid = formulaRegex.test(fm);

    var resultText = "NOPE";
    if (formulaValid) {
        //식계산
        var answer;
        eval('answer=' + fm);
        resultText = fm + " = ";
        resultText
            += (answer % 1 > 0 ? answer.toFixed(2) : answer.toString());
    }

    //calc-history에 삽입
    var resultDiv = document.createElement("DIV");
    resultDiv.appendChild(document.createTextNode(resultText));
    if (!formulaValid)
        resultDiv.classList.add("invalid");
    calcHistDiv.insertBefore(resultDiv, calcHistDiv.firstChild);

    //입력 빈칸으로
    formulaInput.value = "";
}