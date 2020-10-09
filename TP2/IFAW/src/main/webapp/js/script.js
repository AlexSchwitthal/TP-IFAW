function appelJS(pId, pValue) {
	var element = document.getElementById(pId);
	if(element != null) {
		element.value = pValue;
	}
}