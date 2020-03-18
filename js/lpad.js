function lpad(str, position = 'left', padstr = '0', length = 3)
{
	if(str == undefined)
		return;
	let pad = ('' + padstr).repeat(length);
	if(position == 'left') {
		str = pad + str;
		return str.substring(str.length - length, length);
	} else {
		str += pad;
		return str.substring(0, length);
	}
}
