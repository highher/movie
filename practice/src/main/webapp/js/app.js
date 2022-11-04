
let sitemap_icon = document.getElementById('sitemap-icon');
let sitemap_icon_cancle = document.getElementById('sitemap-icon-cancle');
let search_icon = document.getElementById('search-icon');
let search_icon_cancle = document.getElementById('search-icon-cancle');
let sitemap_layout = document.getElementById('sitemap-layout-id');
let search_layout = document.getElementById('search-layout-id');
let mypagepopid = document.getElementById('mypagepopid');
let person_icon = document.querySelector('#person-icon');
let person_icon_cancle = document.querySelector('#person-icon-cancle');
let not=document.querySelectorAll('not');


function not_function(){
	alert("준비중입니다");
}

function sitemap_icon_function(){
    sitemap_icon_cancle.style.display='block';
    sitemap_layout.style.display="block";
    if(search_icon_cancle.style.display==='block'){
        search_icon_cancle_function();
    }
    if(person_icon_cancle.style.display==='block'){
		person_icon_cancle_function();
	}
    sitemap_icon.style.display="none";
}

function sitemap_icon_cancle_function(){
    sitemap_icon_cancle.style.display='none';
    sitemap_layout.style.display="none";
    sitemap_icon.style.display="block";
}

function search_icon_function(){
    search_icon_cancle.style.display='block';
    search_layout.style.display="block";
    if(sitemap_icon_cancle.style.display==='block'){
        sitemap_icon_cancle_function();
    }
    if(person_icon_cancle.style.display==='block'){
		person_icon_cancle_function();
	}
    search_icon.style.display="none";
}

function search_icon_cancle_function(){
    search_icon_cancle.style.display='none';
    search_layout.style.display="none";
    search_icon.style.display="block";
}

function person_icon_function(){
	person_icon_cancle.style.display='block';
	mypagepopid.style.display='block';
	if(search_icon_cancle.style.display==='block'){
       search_icon_cancle_function();
    }
    if(sitemap_icon_cancle.style.display==='block'){
    	sitemap_icon_cancle_function();
    }
	person_icon.style.display='none'
}

function person_icon_cancle_function(){
	person_icon_cancle.style.display='none';
	mypagepopid.style.display='none';
	person_icon.style.display='block'
	
}
person_icon.addEventListener('click',person_icon_function)
person_icon_cancle.addEventListener('click',person_icon_cancle_function)

sitemap_icon.addEventListener('click',sitemap_icon_function);
sitemap_icon_cancle.addEventListener('click',sitemap_icon_cancle_function);

search_icon.addEventListener('click',search_icon_function);
search_icon_cancle.addEventListener('click',search_icon_cancle_function);

