function setMultirecoCardList(data){
	let payTotal = data.payTotal;
	
	let base = 	$('#multi-card-reco-section .slider')

	
	let html = ''
	
	data.benefitList.forEach(function(bn){
		let allPicking = 0;
		let allBenefit = 0;
		let allCardId = ''

		let benefitBtn = ''
		let cardIdx;
		let cardId = bn[0].cardId;
		allCardId = cardId;
		bn.forEach(function(d, idx){
			if(cardId != d.cardId){
				cardId = d.cardId;
				cardIdx = idx;
			}
		})
	
		let benefitTotal = 0;
		//card1
		let className = '.first-card';
		let cardName = bn[0].cardName;
		let allCardName = cardName.split(' ')[1];
		let benefitName = bn[0].benefitName;
		let benefitType;
		if(bn[0].benefitCode == '001' || bn[0].benefitCode == '004'){
			benefitType = '할인';
		}else{
			benefitType = '적립';
		}		

		for(let i = 0; i < cardIdx; i++){
			if(bn[i].benefitName == benefitName){
				benefitTotal += bn[i].benefitTotal;
			}else{
				if(benefitTotal > 0){
					benefitBtn += '<div style="display: table; width:100%; margin-bottom: 5px;">'
								+ '<div class="card" style="width: 50%; display:table-cell; vertical-align: middle;">'
								+ '<span style="font-size:18px; font-weight: bold; color:black;">' + benefitName + '</span>'
								+ '</div><div style="width: 50%; display:table-cell;text-align:center; vertical-align: middle;color:black;">'
								+ addComma((benefitTotal / 3).toFixed(0)) + ' 원 '+benefitType + '</div></div>'
					
					allBenefit += benefitTotal;
				}
				benefitTotal = bn[i].benefitTotal;
				benefitName = bn[i].benefitName;
				if(bn[i].benefitCode == '001' || bn[i].benefitCode == '004'){
					benefitType = '할인';
				}else{
					benefitType = '적립';
				}
				
			}
		}
		
		if(benefitTotal > 0){
			benefitBtn += '<div style="display: table; width:100%; margin-bottom: 5px;">'
						+ '<div class="card" style="width: 50%; display:table-cell; vertical-align: middle;">'
						+ '<span style="font-size:18px; font-weight: bold; color:black;">' + benefitName + '</span>'
						+ '</div><div style="width: 50%; display:table-cell;text-align:center; vertical-align: middle;color:black;">'
						+ addComma((benefitTotal / 3).toFixed(0)) + ' 원 '+benefitType + '</div></div>'
		}
		allBenefit += benefitTotal;
		
		cardImageUrl = bn[0].cardImageUrl;
		base.find(className + ' img').attr('src', cardImageUrl);
		base.find(className + ' .benefit').html(benefitBtn);


		//card2
		benefitBtn = '';
		className = '.second-card';
		cardName = bn[cardIdx].cardName;
		allCardId += ',' + bn[cardIdx].cardId
		allCardName += ' / ' + cardName.split(' ')[1];
		benefitName = bn[cardIdx].benefitName;
		benefitType;
		benefitTotal = 0;
		if(bn[cardIdx].benefitCode == '001' || bn[cardIdx].benefitCode == '004'){
			benefitType = '할인';
		}else{
			benefitType = '적립';
		}		
		
		
		for(let i = cardIdx; i < bn.length; i++){
			if(bn[i].benefitName == benefitName){
				benefitTotal += bn[i].benefitTotal;
			}else{
				if(benefitTotal > 0){
					benefitBtn += '<div style="display: table; width:100%; margin-bottom: 5px;">'
								+ '<div class="card" style="width: 50%; display:table-cell; vertical-align: middle;">'
								+ '<span style="font-size:18px; font-weight: bold; color:black;">' + benefitName + '</span>'
								+ '</div><div style="width: 50%; display:table-cell;text-align:center; vertical-align: middle;color:black;">'
								+ addComma((benefitTotal / 3).toFixed(0)) + ' 원 '+benefitType + '</div></div>'
					allBenefit += benefitTotal;
				}
				benefitTotal = bn[i].benefitTotal;
				benefitName = bn[i].benefitName;
				if(bn[i].benefitCode == '001' || bn[i].benefitCode == '004'){
					benefitType = '할인';
				}else{
					benefitType = '적립';
				}
				
			}
		}
		if(benefitTotal > 0){
			benefitBtn += '<div style="display: table; width:100%; margin-bottom: 5px;">'
						+ '<div class="card" style="width: 50%; display:table-cell; vertical-align: middle;">'
						+ '<span style="font-size:18px; font-weight: bold; color:black;">' + benefitName + '</span>'
						+ '</div><div style="width: 50%; display:table-cell;text-align:center; vertical-align: middle;color:black;">'
						+ addComma((benefitTotal / 3).toFixed(0)) + ' 원 '+benefitType + '</div></div>'
		}
		allBenefit += benefitTotal;
		
		cardImageUrl = bn[cardIdx].cardImageUrl;
		base.find(className + ' img').attr('src', cardImageUrl);
		base.find(className + ' .benefit').html(benefitBtn);
		
		allPicking = ((allBenefit / payTotal) * 100).toFixed(2);
		base.find('.picking').text(allPicking + ' %');
		base.find('.cardCombi').text(allCardName);
		base.find('.dibsBtn').attr('onclick', 'goToMultiDibs2(' + allCardId+');' );
		
		html += base.html();
		
	})
	
	
	
	
	base.html(html);
}