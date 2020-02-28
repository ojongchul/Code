// YYYY-mm-dd HH:ii:ss format의 data를 YYYY년 mm월 dd일로 변환하는 함수
function ConvertDateKr(str)
{
	str = str.replace(" ", "T"); // YYYY-mm-ddTHH:ii:ss 로 변환. safari에서는 이 방식으로 해석해야 함
	let date = new Date(str);
	return date.getFullYear()+"년 " + ("0" + parseInt(date.getMonth()+1) + "월 ").slice(-4) + ("0" + date.getDate() + "일").slice(-3);
}
