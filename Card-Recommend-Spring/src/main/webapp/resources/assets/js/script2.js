//card insert page
let benefitIdx = 0;

$(document).ready(function(){
	
	
	
	
	if(modalMsg != ''){
		$("#modalBtn").click();
	}
	$("#work-sector1").change(function(e){
	    let sector1 = $("#work-sector1 option:selected").val();
	    //sector2 리스트 가져옴
	    $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/data/sector2/" + sector1,
	    	success: function(result){
	    		//console.log(result);
	    		let html = '<option value="0" disabled selected>2차 업종</option>';
	    		result.forEach(function(e){
	    			html += '<option value="' + e.workSector2Code +'">' + e.workSector2Name + '</option>';
	    		});
	    		
	    		$("#work-sector2").html(html)
	    	}
	    });
	    
	    $('.work-sector2-btn-list input').remove()//버튼 지움
	    $('.work-sector2-btn-list span').show()
	});
	
	// sector2 혜택 버튼 추가
	$('#work-sector2').change(function(e){
		$('.work-sector2-btn-list span').hide()
		let sector2 = $("#work-sector2 option:selected").val();
		
		let btn = '<input type="button" id="' + $('#work-sector2').val() + '" class="btn" style="color: #00907f;font-size: 12px;background: white;padding: 3px 6px; margin-bottom:1px;" value="' 
					+ $('#work-sector2 option:checked').text() + '" onclick="$(this).remove();">'
		$('.work-sector2-btn-list').append(btn);
	});
	
	// card input file에 change 이벤트 부여
	$("#cardImage").change(function(e){
		readImage(e.target);
	});
	
	$("#benefit-code").change(function(e){
		let code = $("#benefit-code option:selected").val()
		if(code == '001' || code == '002'){
			$("#percentage").show();
		}else{
		 	$("#percentage").hide();
		}
	});	
	
	$("#benefit-info").on("change keyup paste", function(e){
		let code = $("#benefit-code option:selected").val()
		if(e.keyCode != undefined && (code == '001' || code == '002')){
			let value = $("#benefit-info").val()
		    if(!((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105))){
		    	//경고
		    	$("#benefit-info-warn").show();
		    	$("#benefit-info").val(value.substr(0, value.length-1))
		    }
		    
		    return false;
	    }else{
		    $("#benefit-info-warn").hide(); 
		}
	})

	//---------index.jsp-----------------//
	
	$('#detailModal').on('show.bs.modal', function (event) {
		let btn = $(event.relatedTarget);
		let card = $(btn).parents('.card-item')
		let cardId = card.attr('id').substr(4);
		
		//카드 detail 정보 ajax
		$.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/card/detail/" + cardId,
	    	success: function(card){
	    		$('#detailModal #cardName').text(card.cardName)
	    		$('#detailModal #cardInfo').text(card.cardInfo)
	    		$('#detailModal #cardImage').attr('src', card.cardImageUrl)
	    		$('#detailModal #cardAnnualFee').text(addComma(card.cardAnnualfee))
				$('#multi-combi-section').html('')
	    		
	    		// 찜하기 버튼
	    		if(loginUserFlag){
		    		let dibsList = localStorage.getItem('dibs')
		    		let flag = false;
				    if(localStorage.getItem('dibs') != null){
				    	let tmp = dibsList.split('/');
				    	tmp.forEach(function(d){
				    		if(cardId == d){
				    			flag = true
				    		}
				    	})
				    	if(flag){//이미 찜한 카드
				    		$('#detailModal #dibsBtn').attr('disabled','disabled')
				    	}else{
				    		$('#detailModal #dibsBtn').attr('disabled',false)
				    	}
				    }else{//찜한 기록 X
			    		$('#detailModal #dibsBtn').attr('disabled',false)
				    }
		    		
		    		if(card.cardTypeId == '005'){//멀티카드
						$('#detailModal #dibsBtn').show();
						$('#dibsBtn').attr('onclick', 'goToMultiDibs(' + cardId+', "' + card.cardTypeId + '")')
						$('#multi-card-filter').show();
						
						setMultiCardOption(card.cardId);//멀티카드 옵션 세팅
		    		}else if(card.cardTypeId == '001'){//신용카드
						$('#detailModal #dibsBtn').show();
						$('#dibsBtn').attr('onclick', 'goToDibs(' + cardId+', "' + card.cardTypeId + '")')
						//멀티카드 조합 Select hiding
						$('#multi-card-filter').hide();
		    		}else{//체크카드 => 찜하기 버튼 X
						$('#detailModal #dibsBtn').hide();
		    		}
		    		
				}else{
					$('#multi-card-filter').hide();
					$('#detailModal #dibsBtn').hide();
				}
				
				let benefits = '';
				
				card.benefits.forEach(function(b, idx){
					benefits += '<tr><th scope="row">' + b.benefitName + '</th>';
					
					if(b.benefitCode == '001'){//할인
						benefits += '<td>' + b.benefitInfo +'% <span style="color:#00907f"> 할인</span></td>'
					}else if(b.benefitCode == '002'){//적립
						benefits += '<td>' + b.benefitInfo +'% <span style="color:#00907f"> 적립</span></td>'
					}else if(b.benefitCode == '004'){//현금할인
						benefits += '<td>' + addComma(b.benefitCriteria) +'원당 ' + 
									'<span style="font-weight:bold;">' + addComma(b.benefitInfo) +'원</span> <span style="color:#00907f"> 할인</span></td>'
					}else if(b.benefitCode == '008'){//현금적립
						benefits += '<td>' + addComma(b.benefitCriteria) +'원당 ' + 
									'<span style="font-weight:bold;">' + addComma(b.benefitInfo) +'머니</span> <span style="color:#00907f"> 적립</span></td>'
					}
					benefits += '<td style="white-space: inherit; word-break: break-all;">' + b.workSector2Name +'</td>'
								+ '<td>' + addComma(b.limit) +'원</td>'
								+ '<td>' + addComma(b.perfCriteria) +'원</td>'
				})
							
				
				$('#benefitList #benefitItem').html(benefits)
				
					    	
	    	
	    	}
	    });
		
		
	})
	
	//멀티카드 조합 선택 이벤트
	$('#multi-card-filter').change(function(e){
		let multi = $("#multi-card-filter option:selected")
		let btnSection = $('#multi-combi-section');
		let html = ''
		
		html += '<input type="button" class="rounded btn btn-main" '
			+ 'style="color: #00907f; background: white; border: 1px solid #00907f; padding: 8px; margin:6px;"' 
			+ 'value="' + multi.attr('title') + '" id = "' + multi.val() + '" onclick="$(this).remove();">';
		
		btnSection.append(html);
	});

	
	$("#sortType").change(function(e){
		searchCard();
	});	
	
	$("#card-list-section .card-item").each(function(idx, e){
		
	})
	
	//------------recommend.jsp----------------//
	
	
	$(".benefitAmount").each(function(idx, e){
		let text = $(e).text();
		$(e).text(addComma(text))
	});
	
	$("#benefit-type-filter").change(function(e){
		//mycard 추천 ajax
		$.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/mypage/card/credit/top10/" + $("#benefit-type-filter option:selected").val(),
	    	success: function(result){
	    		//console.log(result)
	    		
	    		changeMyrecoCardList(result)
	    		$('.card-hero-slider1').slick('slickGoTo', 0); // 첫 슬라이드로 넘어감
	    		
	    	}
	    });
	});
	
	
	$("#birth-gender-filter").change(function(e){
		//$("#birth-gender-reco-cardlist").empty()
		//$('.card-hero-slider2').slick('unslick');
		$.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/card/reco/" + $("#birth-gender-filter option:selected").val(),
	    	success: function(result){
	    		changeRecoCardList('#birth-gender-reco-cardlist', result);
	    		/*$('.card-hero-slider2').slick({
	    		  	infinite: false,
	    		  	slidesToShow: 3,
	    		    arrows: true,
	    		    prevArrow: '<button type=\'button\' class=\'prevArrow\'></button>',
	    		    nextArrow: '<button type=\'button\' class=\'nextArrow\'></button>',
	    		    //dots: false
	    		});*/
	    	}
	    });
	});

	$("#job2-filter").change(function(e){
		//$("#job-reco-cardlist").empty()
		//$('.card-hero-slider3').slick('unslick');
		$.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/card/reco/" + $("#job1-filter option:selected").val() + $("#job2-filter option:selected").val(),
	    	success: function(result){
	    		changeRecoCardList('#job-reco-cardlist', result);
	    		/*$('.card-hero-slider3').slick({
	    		  	infinite: false,
	    		  	slidesToShow: 3,
	    		    arrows: true,
	    		    prevArrow: '<button type=\'button\' class=\'prevArrow\'></button>',
	    		    nextArrow: '<button type=\'button\' class=\'nextArrow\'></button>',
	    		    //dots: false
	    		});*/
	    	}
	    });
	});
	
	//job1 => job2 정보 가져옴
	$("#job1-filter").change(function(e){
		$.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/data/job2/" + $("#job1-filter option:selected").val(),
	    	success: function(result){
	    		let html = '<option value="00" disabled selected>세부 직업군</option>';
	    		
	    		result.forEach(function(job){
	    			html += '<option value="'+ job.job2Code +'" selected>' +job.job2Name + '</option>'
	    		});
	    		
	    		$("#job2-filter").html(html);
	    	}
	    });
	});
});


function setMultiCardOption(cardId){
	$('#multi-card-filter option').each(function(idx, e){
		if(e.value == cardId){
			$(e).hide()
		}else{
			$(e).show()
		}
	})
}

function addComma(amount){
	return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

///recommend//////////
function setMyrecoCardList(data){
	let html = ''
	let tmp = $("#reco-mycard-template").html()
	let payTotal = data.payTotal;
	
	data.benefitList.forEach(function(bn, idx){
	
		let benefit = '';
		let benefitTotal = 0;
		let benefitName = '';
		bn.forEach(function(b){
			if(benefitName != b.benefitName){
			 	benefitName = b.benefitName
			 	if(b.benefitTotal > 0){
			 		benefit += '<div style="display: table; width:100%; margin-bottom: 5px;" >'
				 	benefit += '<div class="card" style="width: 50%; display:table-cell; vertical-align: middle;">'
			     		    	+ '<span style="font-size:18px; font-weight: bold; color:black;">' + b.benefitName + '</span></div>'
				 	
				 	benefit += '<div style="width: 50%; display:table-cell;text-align:center; vertical-align: middle;">'
			    	
			    	if(b.benefitCode == '001' || b.benefitCode == '004'){//할인
			    		benefit += addComma((b.benefitTotal / 3).toFixed(0)) + ' 원 할인</div>'
			    	}else{
			    		benefit += addComma((b.benefitTotal / 3).toFixed(0)) + ' 머니 적립</div>'
				 	}
				 	benefit += '</div>'
				}
			 	benefitTotal += b.benefitTotal;
			 } 
		})
		
		//console.log('피킹률 : ' + ((benefitTotal / payTotal) * 100).toFixed(2))
		let medal = ''
		//메달					
		if(idx == 0){//gold
			medal = contextPath + '/resources/assets/images/medal/gold-medal.png'
		}else if(idx == 1){//silver
			medal = contextPath + '/resources/assets/images/medal/silver-medal.png'
		}else if(idx == 2){//bronze
			medal = contextPath + '/resources/assets/images/medal/bronze-medal.png'
		}
		
		html +=  tmp.replace(/\{cardId\}/gi, bn[0].cardId)
					.replace(/\{picking\}/gi, ((benefitTotal / payTotal) * 100).toFixed(2))
					.replace(/\{medalImageUrl\}/gi, medal)
					.replace(/\{cardImageUrl\}/gi, bn[0].cardImageUrl)
					.replace(/\{cardName\}/gi, bn[0].cardName)
					.replace(/\{cardInfo\}/gi, bn[0].cardInfo)
					.replace(/\{benefitAmount\}/gi, addComma((benefitTotal / 3).toFixed(0)))
					.replace(/\{benefits\}/gi, benefit)

		
		html += '</div></div></div>';
		
		
	})
	
	$(".card-hero-slider1").html(html)
}

function changeMyrecoCardList(data){
	let payTotal = data.payTotal;
	data = data.benefitList;
	
	$("#mycard-reco-cardlist .card-slider-item").each(function(idx, bn){
		
		let benefit = '';
		let benefitTotal = 0;
		let benefitName = '';
		data[idx].forEach(function(b){
			if(benefitName != b.benefitName){
			 	benefitName = b.benefitName
			 	if(b.benefitTotal > 0){
			 		benefit += '<div style="display: table; width:100%; margin-bottom: 5px;" >'
				 	benefit += '<div class="card" style="width: 50%; display:table-cell; vertical-align: middle;">'
			     		    	+ '<span style="font-size:18px; font-weight: bold; color:black;">' + b.benefitName + '</span></div>'
				 	
				 	benefit += '<div style="width: 50%; display:table-cell;text-align:center; vertical-align: middle;">'
			    	
			    	if(b.benefitCode == '001' || b.benefitCode == '004'){//할인
			    		benefit += addComma((b.benefitTotal / 3).toFixed(0)) + ' 원 할인</div>'
			    	}else{
			    		benefit += addComma((b.benefitTotal / 3).toFixed(0)) + ' 머니 적립</div>'
				 	}
				 	benefit += '</div>'
				}
			 	benefitTotal += b.benefitTotal;
			 } 
		})
		
		//메달
		if(idx == 0){//gold
			$(bn).find('.medal').attr('src', contextPath + '/resources/assets/images/medal/gold-medal.png')
		}else if(idx == 1){//silver
			$(bn).find('.medal').attr('src', contextPath + '/resources/assets/images/medal/silver-medal.png')
		}else if(idx == 2){//bronze
			$(bn).find('.medal').attr('src', contextPath + '/resources/assets/images/medal/bronze-medal.png')
		}else{
			$(bn).find('.medal').attr('src', '')
		}
		
		$(bn).find('.card-item').attr('id', 'card' + data[idx][0].cardId)
		$(bn).find('.picking').text(((benefitTotal / payTotal) * 100).toFixed(2))
		$(bn).find('.card-image').attr('src', data[idx][0].cardImageUrl)
		$(bn).find('.card-image2').attr('href', data[idx][0].cardImageUrl)
		$(bn).find('.card-name').text(data[idx][0].cardName)
		$(bn).find('.card-info').text(data[idx][0].cardInfo)
		$(bn).find('.benefitAmount').text(addComma((benefitTotal / 3).toFixed(0)))
		
		
		
		$(bn).find('#mycard-benefits').html(benefit);
	});
}

//ajax reco card change
function changeRecoCardList(bodyId, data){
	$(bodyId + " .card-slider-item").each(function(idx, e){
		$(e).find('.card-work-sector').attr('data-category', data[idx].workSectors)
		$(e).find('.card-work-sector').attr('id', 'card' + data[idx].cardId)
		$(e).find('.card-image1').attr('src', data[idx].cardImageUrl)
		$(e).find('.card-image2').attr('href', data[idx].cardImageUrl)
		$(e).find('.card-name').text(data[idx].cardName)
		$(e).find('.card-info').text(data[idx].cardInfo)
		
		let benefits = '';
		if(data[idx].cardTypeId == '001'){//신용카드
			data[idx].benefits.forEach(function(b){
				benefits += '<a class="btn btn-main" '
								+ 'style="color:gray; background:white; margin-bottom: 0;font-size: 13px; padding: 8px 10px;">'
								+ b.benefitName +'</a>';
			})
		}else{//체크카드
			data[idx].workSectorsName.split(',').forEach(function(b){
				benefits += '<a class="btn btn-main" '
							+ 'style="color:rgb(0,144,127,0.7); background:white; margin-bottom: 0;font-size: 13px; padding: 8px 10px;">'
							+ b +'</a>';
			})
		}
		$(e).find('.card-benefit-btn').html(benefits);
		$(bodyId).slick('slickGoTo', 0); // 첫 슬라이드로 넘어감
	});
}

//처음 reco card setting
function setRecoCardList(bodyId, data){
	let body = $(bodyId);
	
	let html = '';
	let tmp = $("#reco-card-template").html();
	data.forEach(function(card){
		//benefits button 생성
		let benefit = '';
		
		if(card.cardTypeId == '001'){
			card.benefits.forEach(function(b){
				benefit += '<a class="btn btn-main" '
							+ 'style="color:gray; background:white; margin-bottom: 0;font-size: 13px; padding: 8px 10px;">'
							+ b.benefitName +'</a>';
			});
		}else{
			card.workSectorsName.split(',').forEach(function(b){
				benefit += '<a class="btn btn-main" '
							+ 'style="color:rgb(0,144,127,0.7); background:white; margin-bottom: 0;font-size: 13px; padding: 8px 10px;">'
							+ b +'</a>';
			})
		}
		
		//html 생성
		html +=  tmp.replace(/\{cardId\}/gi, card.cardId)
					.replace(/\{workSectors\}/gi, card.workSectorsName)
					.replace(/\{cardImageUrl\}/gi, card.cardImageUrl)
					.replace(/\{cardName\}/gi, card.cardName)
					.replace(/\{cardInfo\}/gi, card.cardInfo)
					.replace(/\{benefits\}/gi, benefit)
		
		html += '</div></div></div>';
		
	});
	
	body.html(html)
	
}



///index///////////

//카드 찜
function goToDibs(cardId, cardType){
	//이미 찜한 목록인지 확인
    /*let dibsList = localStorage.getItem('dibs')
    if(localStorage.getItem('dibs') == null){
    	localStorage.setItem('dibs', '')
    }else{
    	let tmp = dibsList.split('/');
    	tmp.forEach(function(d){
    		if(cardI == d){
    		}
    	})
    }*/
    
    if(localStorage.getItem('dibs') == null){
    	localStorage.setItem('dibs', '')
    }
    
    let dibsList = localStorage.getItem('dibs')
    
    //localstorage에 저장
    dibsList += '/' + cardId
    localStorage.setItem('dibs', dibsList)
    
    //찜버튼 비활성화
    $('#detailModal #dibsBtn').attr('disabled','true')
    
    //찜 완료 알림
    toastr.success('찜 등록 완료! \n마이페이지에서 확인할 수 있습니다.')
} 

//multi card 찜하기
function goToMultiDibs(multiCardId){
	console.log(multiCardId)
	let payCardList = [multiCardId];
	
	//멀티카드 조합 만들기
	$('#multi-combi-section input').each(function(idx, e){
		payCardList.push(e.id)
	});

    if(localStorage.getItem('dibs') == null){
    	localStorage.setItem('dibs', '')
    }
    
    let dibsList = localStorage.getItem('dibs')
    let dibsCard = ''
    
    //localstorage에 저장
    payCardList.unshift(0)//multicard임을 표시
    dibsList += '/' + payCardList
    
    localStorage.setItem('dibs', dibsList)
    
    toastr.success('찜 등록 완료! \n마이페이지에서 확인할 수 있습니다.')
} 

//multi card 찜하기
function goToMultiDibs2(...multiCardId){
    if(localStorage.getItem('dibs') == null){
    	localStorage.setItem('dibs', '')
    }
    
    let dibsList = localStorage.getItem('dibs')
    let dibsCard = ''
    
    //localstorage에 저장
    multiCardId.unshift(0)//multicard임을 표시
    dibsList += '/' + multiCardId
    
    localStorage.setItem('dibs', dibsList)
    
    toastr.success('찜 등록 완료! \n마이페이지에서 확인할 수 있습니다.')
} 


function changeCardFilter(btn){
	let filterSectors = btn.title.split(',');
	//console.log("filter : "+filterSectors);
	
	$(".portfolio-filter button").each(function(e, v){
		$(v).removeClass("clicked");
	});
	
	$(btn).addClass("clicked");
	
	//filtering
	$("#card-list-section .card-item").each(function(idx, v){
		let sectors = $(v).attr('data-category').split(',')
		
		let flag = false;
		sectors.forEach(function(num){
			if(filterSectors.includes(num)){
				flag = true;
				return false;
			}
		});
		
		//console.log(idx+"번째 : "+sectors+", "+flag);
		if(!flag){
			$(v).hide();
		}else{
			$(v).show();
		}
	});
}

function changeCardType(btn){
	$(".portfolio-kind-filter a").each(function(e, v){
		$(v).removeClass("clicked");
		$(v).css('color','gray');
	})
	$(btn).addClass("clicked");
	$(btn).css('color','#00907f');
	
	searchCard();
}

function searchCard(){
	// cardType
	let cardType = $(".portfolio-kind-filter .clicked").attr('id').substr('cardType'.length);
	
	// keyWord
	let keyWord = $("#searchKeyWord").val();
	
	// sortType
	let sortType = $("#sortType option:selected").val()
	
	//card 리스트 가져옴
    $.ajax({
    	type: "GET",
    	url: contextPath + "/api/card",
    	data: {
    		cardType : cardType,
    		keyWord : keyWord,
    		sort : sortType
    	},
    	success: function(result){
    		//console.log(result);
    		changeCardListSection(result);
    	}
    });
}

function changeCardListSection(data){
	let body = $("#card-list-section");
	
	let html = '';
	let tmp = $("#card-template").html();
	data.forEach(function(card){
		html +=  tmp.replace(/\{cardId\}/gi, card.cardId)
					.replace(/\{workSectors\}/gi, card.workSectors)
					.replace(/\{cardImageUrl\}/gi, card.cardImageUrl)
					.replace(/\{cardName\}/gi, card.cardName)
					.replace(/\{cardInfo\}/gi, card.cardInfo)
		let benefit = '';
		card.benefits.forEach(function(b){
			benefit += '<a class="btn btn-main" href="javascript:goSearch('+"'"+b.benefitName+"'"+ ')" '
						+ 'style="color:gray; background:white; margin-bottom: 0;font-size: 13px; padding: 8px 10px;">'
						+ b.benefitName +'</a>';
		});
		
		html += benefit + '</div>';
		
	});
	
	$(".portfolio-filter button").each(function(idx, v){
		if(idx == 0){
			$(v).addClass("clicked");
		}else{
			$(v).removeClass("clicked");
		}
	});
	
	body.html(html);
}

//혜택으로 검색어 검색
function goSearch(keyWord){
	$("#searchKeyWord").val(keyWord);
	searchCard()
}

/*
<div id="card{cardId}" style="padding:1rem 2rem;" class="col-md-4 col-sm-6 col-xs-6 filtr-item " data-category="{workSectors}">
	<div class="portfolio-block">
		<img class="img-fluid" style="width: 100%;" src="{cardImageUrl}" alt="">
		<div class="caption" style="width: 100%; ">
			<a class="search-icon" href="${cardImageUrl}" data-lightbox="image-1">
				<i class="tf-ion-ios-search-strong"></i>
			</a>
			<h3 style="font-family: Pretendard; color:white;">{cardName}</h3>
			<h4 style="font-family: Pretendard;"><a href="">{cardInfo}</a></h4>
		</div>
	</div>
</div>
*/


////////////cardInsertform.jsp : admin inserting card/////////////////
function addBenefit(){
	let html = $("#benefit-btn-list").html();
	
	let sector1 = $("#work-sector1 option:selected").text();
	let sector2List = $('.work-sector2-btn-list input');
	let sector2Name = ''
	
	sector2List.each(function(idx,e){
	    sector2Name += e.value+","
	});
	sector2Name = sector2Name.substr(0,sector2Name.length-1) // 마지막 , 제거
	
	let name = $("#benefit-name").val();
	let info = $("#benefit-info").val();
	if($("#benefit-code").val() == '001' || $("#benefit-code").val() == '002'){
		info += '%';
	}	
	
	html += '<input type="button" id="card-insert-submit" class="rounded btn btn-main" '
			+ 'style="color: #00907f; background: white; border: 2px solid #00907f; padding: 8px 15px; margin-top: 5px;"' 
			+ 'value="' + name + "/" + info +" - " + sector1+ "(" +sector2Name+ ")" + '" onclick="deleteBenefit();"><br>';
			
	$("#benefit-btn-list").html(html);
	
	
	//혜택 객체 추가
	let tmp = $("#benefit-item-template").html();
	let benefitCnt = $("#benefit-list").children().length;//지금까지 추가한 혜택 개수
	let html2 = '';
	
	sector2List.each(function(idx, e){
		html2 +=    tmp.replace(/\{idx\}/gi, benefitCnt)
					   .replace(/\{ws1\}/gi, $("#work-sector1 option:selected").val())
					   .replace(/\{ws2\}/gi, e.id)
					   .replace(/\{bc\}/gi, $("#benefit-code option:selected").val())
					   .replace(/\{bn\}/gi, $("#benefit-name").val())
					   .replace(/\{bi\}/gi, $("#benefit-info").val())
					   .replace(/\{bns\}/gi, $("#perf-criteria").val())
					   .replace(/\{l\}/gi, $("#limit").val())
		benefitCnt++
	})
	
	$("#benefit-list").append(html2);

	//input 리셋
	$("#benefit-name").val('');
	$("#benefit-info").val('');
	$("#perf-criteria").val('');
	$("#limit").val('');
	$('.work-sector2-btn-list input').remove()//버튼 지움
    $('.work-sector2-btn-list span').show()
	
	
	
	/*let html = $("#benefit-btn-list").html();
	
	let sector1 = $("#work-sector1 option:selected").text();
	let sector2 = $("#work-sector2 option:selected").text();
	let name = $("#benefit-name").val();
	let info = $("#benefit-info").val();
	if($("#benefit-code").val() == '001' || $("#benefit-code").val() == '002'){
		info += '%';
	}	
	
	html += '<input type="button" id="card-insert-submit" class="rounded btn btn-main" '
			+ 'style="color: #00907f; background: white; border: 2px solid #00907f; padding: 8px 15px; margin-top: 5px;"' 
			+ 'value="' + sector1+"/"+sector2+" - "+name+"/"+info + '" onclick="deleteBenefit();">';
	$("#benefit-btn-list").html(html);
	
	
	//혜택 객체 추가
	let tmp = $("#benefit-item-template").html();
	let benefitCnt = $("#benefit-list").children().length;//지금까지 추가한 혜택 개수
	
	tmp = 	tmp.replace(/\{idx\}/gi, benefitCnt)
			   .replace(/\{ws1\}/gi, $("#work-sector1 option:selected").val())
			   .replace(/\{ws2\}/gi, $("#work-sector2 option:selected").val())
			   .replace(/\{bc\}/gi, $("#benefit-code option:selected").val())
			   .replace(/\{bn\}/gi, $("#benefit-name").val())
			   .replace(/\{bi\}/gi, $("#benefit-info").val())
			   .replace(/\{bns\}/gi, $("#perf-criteria").val())
			   .replace(/\{l\}/gi, $("#limit").val())
	$("#benefit-list").append(tmp);

	//input 리셋
	$("#benefit-name").val('');
	$("#benefit-info").val('');
	$("#business-number").val('');
	$("#limit").val('');*/
}


(function ($) {
  'use strict';

  /* ========================================================================= */
  /*	Page Preloader
  /* ========================================================================= */

  // window.load = function () {
  // 	document.getElementById('preloader').style.display = 'none';
  // }
	
})(jQuery);


function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("cardImageThumbnail")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
        $("#cardImageThumbnail").show();
    }
}


//


/*function headerNavActive(e, nextPage){
  //$(".header-nav .nav-item.active").removeClass("active")
  $(".header-nav .nav-item.active")[0].classList.toggle("active")
  //$(e.parentElement).addClass("active");
  
  location.href = nextPage; 	
}*/


function checkId(){
  let id = document.loginForm.id.value;
  if(id == ''){
  	$("#id").focus();
  	return false;
  }
  
  if($("#password").val() == ''){
  	$("#password").focus();
  	return false;
  }
  
  /*let auth = $("#auth").val();
  document.loginForm.id.value = auth+'_'+id;*/
  return true;
}

function changeAuth(btn){
	$('#auth')[0].value = btn.name;

	$(".auth-filter button[name=ADMIN]")[0].classList.toggle('clicked');
	$(".auth-filter button[name=USER]")[0].classList.toggle('clicked');
}