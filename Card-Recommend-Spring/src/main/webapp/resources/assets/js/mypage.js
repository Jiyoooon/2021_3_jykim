/**
 * mypage.jsp javascript 파일
 */

$(document).ready(function(){
	  
	  //datepicker 활성화
	  //$('#datepicker-start').datepicker({ dateFormat: 'yy-mm-dd' });
	  //$('#datepicker-end').datepicker({ dateFormat: 'yy-mm-dd' });
	  //monthpicker 활성화
	  $('#monthpicker-start').monthpicker({ 
		  dateFormat: 'yy-mm' 
	  });
	  $('#monthpicker-end').monthpicker({ 
		  dateFormat: 'yy-mm' 
	  });
	  
	  
	  
	  
	  $('.mycard-hero-slider').slick({
		  	infinite: true,
		  	slidesToShow: 1,
		    arrows: true,
		    prevArrow: '<button type=\'button\' class=\'prevArrow\'></button>',
		    nextArrow: '<button type=\'button\' class=\'nextArrow\'></button>',
		    //dots: false
	  });
	  
	  $('.card-number').each(function(idx, e){
		  let cardNumber = $(e).text().trim();
		  cardNumber = cardNumber.substr(0,4) + '-' + cardNumber.substr(4,4) + '-' + cardNumber.substr(8,4) + '-' + cardNumber.substr(12,4)
		  $(e).text(cardNumber)
		  
	  })
	  
	  $('#monthpicker-end').change(function(e){
		  goSearchConsumption();
		  $('#dibscard-benefit-history #card-benefit-section').html('')
	  })
	  
	  //소비 그래프 데이터 가져옴 
	  goSearchConsumption();
	  
	  getDibsCards()
	  
  })
  
  function getDibsCards(){
	  let dibsList = localStorage.getItem('dibs')
	  if(dibsList == null){
		  return;
	  }
	  
	  $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/card/dibs",
	    	data: {
	    		dibsLit : dibsList
	    	},
	    	success: function(result){
	    		//카드찜 사이드 채우기
	    		setDibsPage(result)
			}
	  });
  }
  
  //카드찜 사이드 채우기
  function setDibsPage(data){
	  let normal = $('#normal-item-template').html();
	  let multi = $('#multi-item-template').html();
	  let html = ''
	  
	  data.forEach(function(d){
		  if(d.multiFlag == 'F'){//일반 카드
			  html += normal.replace(/\{cardId\}/gi, d.cardId)
							.replace(/\{cardImageUrl\}/gi, d.cardImageUrl)
							.replace(/\{cardName\}/gi, d.cardName)
							.replace(/\{cardType\}/gi, d.cardType)
		  }else{//멀티카드
			  let cardList = []
		  	  let payTmp = ''
			  d.payCards.forEach(function(m){
				  cardList.push(m.cardId);
				  payTmp += '<img id="card-image" data-toggle="tooltip" src="' + m.cardImageUrl + '" title="' + m.cardName + '" style="margin: 2.5px 5px;" width="35%">'
			  })
			  html +=  multi.replace(/\{cardId\}/gi, d.cardId)
							.replace(/\{cardImageUrl\}/gi, d.cardImageUrl)
							.replace(/\{cardName\}/gi, d.cardName)
							.replace(/\{cardType\}/gi, d.cardType)
							.replace(/\{clickEvent\}/gi, 'goSearchMultiDibsBenefitHistory(' + cardList.toString() + ')');
		  	  /* d.payCards.forEach(function(m){
				  html += '<img id="card-image" data-toggle="tooltip" src="' + m.cardImageUrl + '" title="' + m.cardName + '" style="margin: 2.5px 5px;" width="35%">'
		  	  }); */
		  
		  	  html += payTmp + '</div></div>'
		  }
	  })
	  
	  $('#dibs-list').html(html)
	  //tooltip 활성화
	  $('#dibs-list img[data-toggle="tooltip"]').tooltip({
		  placement:'bottom',
		  html: true
	  });
  }
  
  
  //신용카드 찜 대조
  function goSearchDibsBenefitHistory(cardId){
	  
	  let start = $('#monthpicker-start').val();
	  let end = $('#monthpicker-end').val();
	  $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/mypage/card/credit/dibs/benefit/" + cardId + '/' + start + '/' + end,
	    	success: function(result){
	    		console.log(result);
	    		if(result.length == 0){
	    			//혜택 내역 부분 비우기
	    			//$('#bar-chart-warn').text('해당 기간에 결제 내역이 없습니다.')
	    			return;
	    		}
	    		dibsData = result
	    		
	    		setBenefitHistory('#dibscard-benefit-history #card-benefit-section', result)
	    		//그래프에 파란색 테두리 ** 
	    		
	    		let barLabels = []
			    let barData = []
			    
			    chartData.forEach(function(e){
			    	barLabels.push(e.workSector1Name)
			    	barData.push(e.sectorBalance)
			    })
	    		//바 차트 => 1차
			    setBarChart(barLabels, barData, dibsData)
			    //도넛 차트 => 2차
			    setDonutChart(0, chartData[0], dibsData)
	    		
			    $('.fixed-plugin').toggleClass('show')
			    
			}
	  });
  }

  //멀티카드 찜 대조
  function goSearchMultiDibsBenefitHistory(...cardId){
	  let start = $('#monthpicker-start').val();
	  let end = $('#monthpicker-end').val();
	  $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/mypage/card/multi/dibs/benefit/" + cardId.toString() + '/' + start + '/' + end,
	    	success: function(result){
	    		console.log(result)
	    		if(result.length == 0){
	    			//혜택 내역 부분 비우기
	    			//$('#bar-chart-warn').text('해당 기간에 결제 내역이 없습니다.')
	    			return;
	    		}
	    		
	    		setBenefitHistory2('#dibscard-benefit-history #card-benefit-section', result)
	    		//
	    		
	    		dibsData = result
	    		
	    		let barLabels = []
			    let barData = []
			    
			    chartData.forEach(function(e){
			    	barLabels.push(e.workSector1Name)
			    	barData.push(e.sectorBalance)
			    })
	    		//바 차트 => 1차
			    setBarChart(barLabels, barData, dibsData)
			    //도넛 차트 => 2차
			    setDonutChart(0, chartData[0], dibsData)
	    		
			    $('.fixed-plugin').toggleClass('show')
			    
			}
	  });
	  
  }
  
  //소비 그래프 데이터
  function goSearchConsumption(){
	  if($('#monthpicker-start').val() == ''){
		  setMonthpicker(3)//저번달 기준
	  	  return;
	  }

	  let start = $('#monthpicker-start').val();
	  let end = $('#monthpicker-end').val();
	  
	  
	  //기간 동안 소비 그래프
	  $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/mypage/card/consumption/" + start + '/' + end,
	    	success: function(result){
	    		chartData = result;
	    		
	    		
	    		
	    		if(result.length == 0){
	    			$('#bar-chart-warn').text('해당 기간에 결제 내역이 없습니다.')
	    			return;
	    		}
			    
			    let barLabels = []
			    let barData = []
			    
			    result.forEach(function(e){
			    	barLabels.push(e.workSector1Name)
			    	barData.push(e.sectorBalance)
			    })
			    
			    getBenefitHistoryAjax(start, end);
			    
			    //바 차트 => 1차
			    setBarChart(barLabels, barData, null)
			    //도넛 차트 => 2차
			    setDonutChart(0, chartData[0], null)
			}
	  });
	  
	
  }
  
  function getBenefitHistoryAjax(start, end){
	  //기간동안 혜택 내역
	  $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/mypage/card/benefit/" + start + '/' + end,
	    	success: function(result){
	    		if(result.length == 0){
	    			//혜택 내역 부분 비우기
	    			//$('#bar-chart-warn').text('해당 기간에 결제 내역이 없습니다.')
	    			return;
	    		}
	    		
	    		setBenefitHistory('#mycard-benefit-history #card-benefit-section', result)
			    
			}
	  });
  }
  
  //혜택 내역 
  function setBenefitHistory(baseId, data){
	  let base = $(baseId);
	  let cardId = [];
	  let benefitName = []
	  
	  data.forEach(function(d){
		  cardId.push(d.cardId);
		  benefitName.push(d.benefitName);
	  })
	  cardId = new Set(cardId)
	  benefitName = new Set(benefitName)
	  
	  let header = $('#benefit-card-header-template').html();
	  let body = $('#benefit-card-body-template').html();
	  
	  
	  let html = '';
	  let btnHtml = '';
	  let cardTotalBenefit = 0
	  
	  let benefitBtns = '';
	  let benefitSubTotal = '';
	  let totalBenefit = 0;
	  let imageUrl = ''
	  
	  let coinType = ''
	  let benefitType = ''
	  cardId.forEach(function(c){
		  benefitName.forEach(function(bn){
			  //btnHtml = ''
			  totalBenefit = 0;//카드마다 benefitTotal 갱신
			  benefitBtns = '';
			  benefitSubTotal = '';
			  
			  //benefitName 당 benefit-card-body-template 1개
			  data.forEach(function(d){
				  if(d.benefitTotal > 0 && d.cardId == c && d.benefitName == bn){ 
					  benefitBtns += '<button style="padding: 2px 4px;margin:5px;" id="'+d.workSector1Name + '" class="btn btn-outline-primary btn-lg mb-0 mycard-btn">'
			     						+ d.workSector2Name + '</button>'
			     	  totalBenefit = d.benefitTotal
			     	  imageUrl = d.cardImageUrl
			     	  if(d.benefitCode == '001' || d.benefitCode == '004'){
			     		 coinType = '원'
			     		 benefitType = '할인'
			     	  }else if(d.benefitCode == '002' || d.benefitCode == '008'){
			     		  coinType = '머니'
			     		  benefitType = '적립'
			     	  }
				  }
			  })
			  
			  if(totalBenefit > 0){
				  btnHtml += body.replace(/\{benefitName\}/gi, bn)
				    			 .replace(/\{benefitBtns\}/gi, benefitBtns)
				    			 .replace(/\{benefitSubTotal\}/gi, '<strong>' + addComma(totalBenefit) + coinType +' </strong>' + benefitType)
			  }
			  cardTotalBenefit += totalBenefit;
			  
		  })
		  if(cardTotalBenefit > 0){
			  
			  let payTotal = $('#bar-chart-section #payTotal').attr('title');
			  html += header.replace(/\{cardImageUrl\}/gi, imageUrl)
			  				.replace(/\{totalBenefit\}/gi, addComma(cardTotalBenefit))
			  				.replace(/\{pickingPercentage\}/gi, ((cardTotalBenefit / payTotal) * 100).toFixed(2))
			  				.replace(/\{benefitsBody\}/gi, btnHtml)
		  }
	  })
	  
	  base.html(html)
	  
	  $(baseId + ' .mycard-btn').click(function(e){
	  	barChart.data.labels.forEach(function(d, idx){
	  		if(d == e.target.id){
	  			setDonutChart(idx, chartData[idx], dibsData)
	  		}
	  	})
	  })
	  
  }
  
  //for multi dibs
  function setBenefitHistory2(baseId, data){
	  let base = $(baseId);
	  let cardId = [];
	  let benefitName = []
	  
	  data.forEach(function(d){
		  cardId.push(d.cardId);
		  benefitName.push(d.benefitName);
	  })
	  cardId = new Set(cardId)
	  benefitName = new Set(benefitName)
	  
	  let header = $('#benefit-card-header-template').html();
	  let body = $('#benefit-card-body-template').html();
	  
	  let html = '';
	  let allBenefit = 0;
	  let allPicking = 0;
	  
	  let btnHtml = '';
	  let cardTotalBenefit = 0
	  
		  
	  let benefitBtns = '';
	  let benefitSubTotal = '';
	  let totalBenefit = 0;
	  let imageUrl = ''
	  
	  let coinType = ''
	  let benefitType = ''
	  cardId.forEach(function(c){
		  btnHtml = ''
		  cardTotalBenefit = 0;
		  benefitName.forEach(function(bn){
			  totalBenefit = 0;//카드마다 benefitTotal 갱신
			  benefitBtns = '';
			  benefitSubTotal = '';
			  
			  //benefitName 당 benefit-card-body-template 1개
			  data.forEach(function(d){
				  if(d.cardId == c && d.benefitName == bn){ 
					  benefitBtns += '<button style="padding: 2px 4px;margin:5px;" id="'+d.workSector1Name + '" class="btn btn-outline-primary btn-lg mb-0 mycard-btn">'
			     						+ d.workSector2Name + '</button>'
			     	  totalBenefit += d.benefitTotal
			     	  imageUrl = d.cardImageUrl
			     	  if(d.benefitCode == '001' || d.benefitCode == '004'){
			     		 coinType = '원'
			     		 benefitType = '할인'
			     	  }else if(d.benefitCode == '002' || d.benefitCode == '008'){
			     		  coinType = '머니'
			     		  benefitType = '적립'
			     	  }
				  }
			  })
			  
			  if(totalBenefit > 0){
				  btnHtml += body.replace(/\{benefitName\}/gi, bn)
				    			 .replace(/\{benefitBtns\}/gi, benefitBtns)
				    			 .replace(/\{benefitSubTotal\}/gi, '<strong>' + addComma(totalBenefit) + coinType +' </strong>' + benefitType)
			  }
			  cardTotalBenefit += totalBenefit;
			  
		  })
		  if(cardTotalBenefit > 0){
			  let payTotal = $('#bar-chart-section #payTotal').attr('title');

			  allBenefit += cardTotalBenefit;
			  allPicking += (cardTotalBenefit / payTotal) * 100
			  
			  html += header.replace(/\{cardImageUrl\}/gi, imageUrl)
			  				.replace(/\{totalBenefit\}/gi, addComma(cardTotalBenefit))
			  				.replace(/\{pickingPercentage\}/gi, ((cardTotalBenefit / payTotal) * 100).toFixed(2))
			  				.replace(/\{benefitsBody\}/gi, btnHtml)
		  }
	  })
	  
	  
	  //멀티카드일 경우 총 피킹률 + 혜택 합계
	  html = '<div style="text-align: center">멀티카드 조합의 총 혜택'
            + '<br><h5 style="font-family:\'Pretendard\';">' + addComma(allBenefit) + ' 원 (' + allPicking.toFixed(2) +' %)</h5></div>' + html
	  
	  base.html(html)
	  
	  $(baseId + ' .mycard-btn').click(function(e){
	  	barChart.data.labels.forEach(function(d, idx){
	  		if(d == e.target.id){
	  			setDonutChart(idx, chartData[idx], dibsData)
	  		}
	  	})
	  })
	  
  }
  
  //monthpicker setting
  function setMonthpicker(num){
	  let today = new Date(); 
	  let month = String(today.getMonth() + 1).padStart(2, '0');
	  let year = today.getFullYear();
	  
	  if(num == 1){//작년
		$('#monthpicker-start').val((year-1) + '-01')  
		$('#monthpicker-end').val((year-1) + '-12')  
	  
	  }else if(num == 2){//올해
		$('#monthpicker-start').val(year + '-01')  
		$('#monthpicker-end').val(year + '-' + month)  
		  
	  }else if(num == 3){//저번달
		let lastMonth = String(month-1).padStart(2,'0')
		$('#monthpicker-start').val(year + '-' + lastMonth) 
		$('#monthpicker-end').val(year + '-' + lastMonth) 
		  
	  }else{//num == 4, 이번달
		$('#monthpicker-start').val(year + '-' + month )  
		$('#monthpicker-end').val(year + '-' + month)  
	  
	  } 
	  //기간동안 소비 데이터 검색
	  goSearchConsumption();
	  $('#dibscard-benefit-history #card-benefit-section').html('')
  }
  
  
  function assignColor(idx, len){
	  let color = []
	  let step = 40;
	  
	  if(len > 20) step = 6;
	  else if(len > 15) step = 10; 
	  else if(len > 10) step = 20;
	  else if(len > 5) step = 30;
	  
	  let r = chartRgb[idx][0];
	  let g = chartRgb[idx][1];
	  let b = chartRgb[idx][2];
	  
	  while(len > 0){
	      color.push("rgba(" + r + "," + g + "," + b + ", 1)"); 
		  r = (r - step > 0) ? r - step : r;
		  g = (g - step > 0) ? g - step : g;
		  b = (b - step > 0) ? b - step : b;
		  len--
	  }
	  return color 
  }
  
  var donutChart = null;
  function setDonutChart(idx, data, dibsData){
	  $('#donut-chart-section').html('<canvas id="donut-chart" class="chart chart-pie" style="padding: 20px;"></canvas>')
	  $('#donut-sector1-name').text(data.workSector1Name)
	  
	  let donutLabels = [];
	  let donutData = [];
	  
	  data.chart2List.forEach(function(e){
		  donutLabels.push(e.workSector2Name)
	  	  donutData.push(e.sector2Balance)
	  })
	  
	  let ctx_donut = document.getElementById('donut-chart').getContext('2d'); 
	  donutChart = new Chart(ctx_donut, {
		    type: 'doughnut',
		    data: {
		      labels: donutLabels,
		      datasets: [{
		        data: donutData,      // 섭취량, 총급여량 - 섭취량
		        backgroundColor: assignColor(idx, data.chart2List.length),
		        borderColor: getBenefitBorderColor(chartData[idx].chart2List, dibsData),
		        borderWidth: 5,
		        //scaleBeginAtZero: true,
		        hoverOffset: 20
		      }]
		    },
		    options: {
				//responsive: false,
				pieceLabel: { 
					//mode: "label",
					 render: function(d) { 
						 return d.label + "(" + d.percentage + "%)" 
					 },
					 fontColor: '#000',
					 //fontSize:'bold',
					 position: 'outside',
					 segment: true
				},
				onClick: function(point, event) {
					let idx = event[0]['_index']
					let workName = donutChart.chart.data.labels[idx]
					
					$('#mycard-benefit-history .mycard-btn').each(function(idx, e){
						$(e).parents('.benefit-card').css('background', 'transparent')
					})

					$('#dibscard-benefit-history .mycard-btn').each(function(idx, e){
						$(e).parents('.benefit-card').css('background', 'transparent')
					})
					
					$('#mycard-benefit-history .mycard-btn').each(function(idx, e){
						if(e.innerText.trim() == workName){
							$(e).parents('.benefit-card').css('background', 'rgb(255,212,96, 0.6)')
						}
					})

					$('#dibscard-benefit-history .mycard-btn').each(function(idx, e){
						if(e.innerText.trim() == workName){
							$(e).parents('.benefit-card').css('background', 'rgb(255,212,96, 0.6)')
						}
					})
					
		        },
				legend: false,
				maintainAspectRatio : false, 
				cutoutPercentage: 60,
				scaleShowLabelBackdrop : true,
			}
		  
		});
	  
	  //$('#donut-chart').css('height','450px')
  }
  
  //업종1 혜택 높은 순서로 카드 조회
  function setTop3Card(idx){
	  
	  /* $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/mypage/card/reco/" + chartData[idx].workSector1Code,
	    	success: function(result){

	    		//top3-card-list 채움
	    		//setTop3CardList(result)
			}
	  }); */
  }
  
  var barChart;
  function setBarChart(labels, data, dibsData){
	  $('#bar-chart-warn').text('')
	  $('#bar-chart-section').html('<canvas id="bar-chart" style="padding: 20px;"></canvas>'
	  							+ '<div style="font-weight:bold; float:right;margin-right:50px;">총 합계 : <span id="payTotal"></span> 원</div>')
	 //소비 그래프
	
	  let ctx_bar = document.getElementById('bar-chart').getContext('2d'); 
	  barChart = new Chart(ctx_bar, {
	    type: 'bar',
	    data: {
	        labels: labels, 
	        datasets: [
	         {
	            label: '업종별 소비량',
	            data: data,
	            //borderColor: "rgba(255, 201, 14, 1)",
	            backgroundColor:  
	            	"rgba(255, 201, 14, 1)",
//	            	"rgba(213,213,213)",
//	            	"rgba(181,214,146)",
//	            	"rgba(171,242,0)",
//	            	"rgba(250,237,125)",
				borderColor: getBenefitBorderColor(chartData, dibsData),
				borderWidth: 5,
	            fill: false,
	        }
	       /*  ,{
	            label: '찜카드 소비량',
	            data: data2,
	            backgroundColor: getCompareColor(data, data2),
	            borderColor: getCompareBorderColor(data, data2),
	            borderWidth: 1,
	            fill: false,
	        }  */
	        ]
	    },
	    options: {
	    	legend: {
	    		labels:{
	    			fontSize: 15
	    		}
	    	},
	    	label: {
	            font: {
					fontColor: "black",
	                family: "Pretendard",
	                fontSize: 15,
	            }
	        },
			data: {
	            font: {
	            	fontSize: 20,
	                family: "Pretendard"
	            }
	        },
	        responsive: true,
	        title: {
	            display: true,
	            text: '소비 그래프',
	            fontSize: 25,
				fontFamily: 'Pretendard'
	        },
	        hover: {
	            mode: 'nearest',
	            intersect: true,
	            backgroundColor: "rgba(255, 201, 14, 1)",
	            
	        },
	        onClick: function(point, event) {
	            if(event.length <= 0) return;
				let idx = event[0]['_index']
				
				//도넛 차트 새로그림
				setDonutChart(idx, chartData[idx], dibsData)
				setTop3Card(idx)
	        },
	        scales: {
	            xAxes: [{
	                display: true,
	                scaleLabel: {
	                    display: true,
	                    //labelString: '업종'
	                },
	                ticks: {
	                    autoSkip: false,
	                    fontFamily:'Pretendard',
	                    fontSize: 15
	                }
	            }],
	            yAxes: [{
	                display: true,
	                ticks: {
	                    suggestedMin: 0,
	                    callback: function(value, index) {
	                    	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	                    },
	                    fontSize: 15
	                },
	                scaleLabel: {
	                    display: true,
	                    //labelString: '소비 금액'
	                }
	            }]
	        }
	    } 
	    
	});
	
	  let payTotal = 0;
	  data.forEach(function(d){
		  payTotal += d;
	  })
	  $('#bar-chart-section #payTotal').text(addComma(payTotal))
	  $('#bar-chart-section #payTotal').attr('title', payTotal)

  }
  
  //비교 그래프 색깔
  function getCompareColor(data, data2){
	  let color = []
	  data.forEach(function(d, idx){
		  if(d < data2[idx]){
			  color.push('rgb(255,0,0,0.3)')
		  }else{
			  color.push('rgb(0,0,255,0.3)')
		  }
	  })
	  return color
  }
  function getCompareBorderColor(data, data2){
	  let color = []
	  data.forEach(function(d, idx){
		  if(d < data2[idx]){
			  color.push('rgb(255,0,0,1)')
		  }else{
			  color.push('rgb(0,0,255,1)')
		  }
	  })
	  return color
  }
  //혜택이 적용된 업종의 경우 border 처리
  function getBenefitBorderColor(data, dibsData){
	  let color = []
	  if(dibsData == null){
		  
		  data.forEach(function(d, idx){
			  if(d.hasBenefit == 1){
				  color.push('rgb(255,0,0,1)')
			  }else{
				  color.push('transparent')
			  }
		  })
		  return color;
	  }else{
		  let flag = false;
	  
		  data.forEach(function(d, idx){
			  flag = false;
			  if(d.hasBenefit == 1){
				  
				  dibsData.forEach(function(dibs){
					  if((d.workSector1Code == dibs.workSector1Code || d.workSector2Code == dibs.workSector2Code)
							  && dibs.benefitTotal > 0){//찜카드로 혜택 받을 수 있는 업종의 경우
						  flag = true;
						  return false;
					  }
				  })
				  if(flag){
					  color.push('#6F00A0')
				  }else{
					  color.push('rgb(255,0,0,1)')
				  }
			  }else{
				  dibsData.forEach(function(dibs){
					  if((d.workSector1Code == dibs.workSector1Code || d.workSector2Code == dibs.workSector2Code)
							  && dibs.benefitTotal > 0){//찜카드로 혜택 받을 수 있는 업종의 경우
						  flag = true;
						  return false;
					  }
				  })
				  if(flag){
					  color.push('rgb(1,0,255,1)')
				  }else{
					  color.push('transparent')
				  }
			  }
		  })
		  return color
	  }
  }
  
  
  //Fixed Plugin
  if (document.querySelector('.fixed-plugin')) {
    var fixedPlugin = document.querySelector('.fixed-plugin');
    var fixedPluginButton = document.querySelector('.fixed-plugin-button');
    var fixedPluginButtonNav = document.querySelector('.fixed-plugin-button-nav');
    var fixedPluginCard = document.querySelector('.fixed-plugin .card');
    var fixedPluginCloseButton = document.querySelectorAll('.fixed-plugin-close-button');
    var navbar = document.getElementById('navbarBlur');
    var buttonNavbarFixed = document.getElementById('navbarFixed');

    if (fixedPluginButton) {
      fixedPluginButton.onclick = function() {
        if (!fixedPlugin.classList.contains('show')) {
          fixedPlugin.classList.add('show');
        } else {
          fixedPlugin.classList.remove('show');
        }
      }
    }

    if (fixedPluginButtonNav) {
      fixedPluginButtonNav.onclick = function() {
        if (!fixedPlugin.classList.contains('show')) {
          fixedPlugin.classList.add('show');
        } else {
          fixedPlugin.classList.remove('show');
        }
      }
    }

    fixedPluginCloseButton.forEach(function(el) {
      el.onclick = function() {
        fixedPlugin.classList.remove('show');
      }
    })

    document.querySelector('body').onclick = function(e) {
      if (e.target != fixedPluginButton && e.target != fixedPluginButtonNav && e.target.closest('.fixed-plugin .card') != fixedPluginCard) {
        fixedPlugin.classList.remove('show');
      }
    }

    if (navbar) {
      if (navbar.getAttribute('navbar-scroll') == 'true') {
        buttonNavbarFixed.setAttribute("checked", "true");
      }
    }

  }
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
    
    
    let an = $('#account-number').text().trim()
    an = an.substr(0,6) + '-' + an.substr(6,2) + '-' + an.substr(8,14)
    $('#account-number').text(an)