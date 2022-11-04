let xmlHttpRequest;

//이벤트 위임으로 처리
const theater_check_inner_items=document.querySelector('.theater-check-inner-top');
let preTarget=document.querySelectorAll('.theater-check-inner-top-item')[0];

preTarget.classList.add('theater-check-inner-top-item-selected')

function theater_check_inner_top_item_selected(e){

const target = e.target;

    if(target.className === 'theater-check-inner-top-item' && target!==preTarget){
        preTarget.classList.remove('theater-check-inner-top-item-selected');
        target.classList.add('theater-check-inner-top-item-selected');
        preTarget=target;        
        let location = target.getAttribute('location');
        console.log(location) 

        xmlHttpRequest = new XMLHttpRequest();
        xmlHttpRequest.onreadystatechange=()=>{
			if(xmlHttpRequest.readyState===XMLHttpRequest.DONE&&xmlHttpRequest.status===200){
				console.log('communication success')

				let div = document.querySelector('.theater-check-inner-middle-item-list');
				
				
               let theater =JSON.parse(xmlHttpRequest.responseText);
               let innerhtml ="";
                                        
               for(i=0;i<theater.length;i++){
               innerhtml+='<li theaterid= "'+theater[i].id+'"><a href="movie?command=theaterView&id='+theater[i].id+'">'+
               theater[i].name+'</a></li>'
               }
				
				div.innerHTML=innerhtml;
						
			}else{
				console.log('error occur')
			}
		}
		xmlHttpRequest.open('post','./movie?command=ajaxTheaterList&location='+encodeURIComponent(location),true);
    	xmlHttpRequest.send(null)
    }

}

theater_check_inner_items.addEventListener('click',theater_check_inner_top_item_selected)