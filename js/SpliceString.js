// 입력된 문자 중 숫자와 쉼표로 된 값을 tag로 감싸주는 함수
function setSplitString(value, tag)
{
	if(tag == null)
		tag = 'span';

	return value.replace(/[0-9,]+/g, function(m) {return '<'+tag+'>' + m + '</'+tag+'>';});
}

console.log(setSplitString("2020년 2월 28일"));
<span>2020</span>년 <span>2</span>월 <span>28</span>일

console.log(setSplitString("2020년 2월 28일", "em"));
<em>2020</em>년 <em>2</em>월 <em>28</em>일
