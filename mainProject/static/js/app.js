window.onscroll = function() {myFunction()};

var navbar = document.querySelector(".navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky");
  } else {
    navbar.classList.remove("sticky");
  }
}
const stars =  document.querySelectorAll('#myPopup i')
function setRating(lastRating){
  for(let i=0; i<stars.length; i++){
    if (i+1<=lastRating){
      stars[i].classList.replace('far','fas');
    }else{
      stars[i].classList.replace('fas','far');
    }
  }
}

$(document).ready(function(){
  setRating(window.PARAMS['ownerRating']);
});


stars.forEach((element, index) => {
  element.addEventListener('click', ()=>{
    console.log('rating', index);
    const isAuth = window.PARAMS['isAuth'];
    console.log(isAuth);
    if(!isAuth){
      window.location.replace(window.PARAMS['loginUrl']);
      return 
    }
    $.ajax({
      url: `${window.PARAMS['ratingUrl']}?rating=${index+1}`,
      success: function(data){
          console.log(data);
          const {rating, owner_rating} = data;
          document.querySelector('#rating').innerText = rating;
          setRating(owner_rating);
      },
      error: function(data){
          alert('error');
      }
  });
  })
})