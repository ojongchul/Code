// 환화 금액 변환 함수 
// 2,000,000 -> 2000000
function strToAmount(str)
{
    if(str == undefined) return '0';
    return str.replace(/,/gi, "");
}

// 2000000 -> 2,000,000
function AmountToStr(str)
{
    if(str == undefined) return '0';
	return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
