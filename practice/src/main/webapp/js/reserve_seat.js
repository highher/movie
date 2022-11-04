let adult=document.querySelector('#adult').contextContent;
let student=document.querySelector('#student').contextContent;
const seats = [];
const seats_length = adult + student;
if(seats.length>=seats_length){
	seats.lenght=seats_length;
}

function selectSeat(e){
	const target = e.target;
	const pretarget = null;
	if(target.className == "able"&target!=pretarget){
		target.classList.add('seat-selected')
		pretarget=target;
	}
}
const seat_area = document.querySelector('.seat');
seat_area.addEventListener('click',selectSeat)