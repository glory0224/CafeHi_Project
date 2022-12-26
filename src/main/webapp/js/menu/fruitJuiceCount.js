function countFruitJuiceList0(type)  {
	  // 결과를 표시할 element
	  const resultCount = document.getElementById('fruitCount0');
	  const resultAmount = document.getElementById('fruitAmount0');
	  
	  // 현재 화면에 표시된 값
	  let number = resultCount.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus' && number > 0)  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultCount.innerText = number;
	  resultAmount.value = resultCount.innerText
	}
function countFruitJuiceList1(type)  {
	  // 결과를 표시할 element
	  const resultCount = document.getElementById('fruitCount1');
	  const resultAmount = document.getElementById('fruitAmount1');
	  
	  // 현재 화면에 표시된 값
	  let number = resultCount.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus' && number > 0)  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultCount.innerText = number;
	  resultAmount.value = resultCount.innerText
	}
function countFruitJuiceList2(type)  {
	  // 결과를 표시할 element
	  const resultCount = document.getElementById('fruitCount2');
	  const resultAmount = document.getElementById('fruitAmount2');
	  
	  // 현재 화면에 표시된 값
	  let number = resultCount.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus' && number > 0)  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultCount.innerText = number;
	  resultAmount.value = resultCount.innerText
	}