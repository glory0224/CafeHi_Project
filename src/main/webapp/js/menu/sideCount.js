function countSideList0(type)  {
	  // 결과를 표시할 element
	  const resultCount = document.getElementById('sideCount0');
	  const resultAmount = document.getElementById('sideAmount0');
	  
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
function countSideList1(type)  {
	  // 결과를 표시할 element
	  const resultCount = document.getElementById('sideCount1');
	  const resultAmount = document.getElementById('sideAmount1');
	  
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
function countSideList2(type)  {
	  // 결과를 표시할 element
	  const resultCount = document.getElementById('sideCount2');
	  const resultAmount = document.getElementById('sideAmount2');
	  
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
function countSideList3(type)  {
	  // 결과를 표시할 element
	  const resultCount = document.getElementById('sideCount3');
	  const resultAmount = document.getElementById('sideAmount3');
	  
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
