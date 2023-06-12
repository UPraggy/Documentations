var width_ = screen.availWidth;
var height_ = screen.availHeight;


$('#theme').change(function() {
    // this will contain a reference to the checkbox  
     
    if (this.checked) {
        document.documentElement.setAttribute('data-theme', 'dark');
        localStorage.setItem('theme', 'dark'); //add this
    } else {
        document.documentElement.setAttribute('data-theme', 'light');
        localStorage.setItem('theme', 'light'); //add this
    }
});


$('#menu-toggle').change(function() {
  $('#topMenu').removeClass('showMenu');
  $('#topMenu').addClass('hideMenu');
  $(".IconImg-Mob").css("display","none")
});

$('#menu-toggle1').change(function() {
  $('#topMenu').removeClass('hideMenu');
  $('#topMenu').addClass('showMenu');
  setTimeout(()=>$(".IconImg-Mob").css("display","flex"),400)
        
});


if (width_ <= 767) { //screen.width;
  $('#NameM1T1').html('Rafael Moreira')
  $('#btn1M1').html(`Competências
								<div class="seta seta-direita"></div>`	)
  $('#btn2M1').html(`Curriculum
								<div class="seta seta-direita"></div>`	)
  $('#topMenu').css("min-height",height_+"px")
  $('#topMenu').css("max-height",height_+"px")

}

$("#btn1M1").click((e)=>{
  window.location.href = "#competencias";
})

$('#btn2M1').click(function(e) {
    e.preventDefault();  //stop the browser from following
    window.location.href = 'static/RafaelMoreira_Curriculo.pdf';
});

$(".projM6").mouseover((e)=>{
  $('#'+e.currentTarget.id+' .modalM6').css('display', 'flex')
})

$(".projM6").mouseout((e)=>{
  $('#'+e.currentTarget.id+' .modalM6').css('display', 'none')
})

$(".projM6").click((e)=>{
  let objAtt = e.currentTarget.getAttribute("details")
  $('#'+objAtt).css('display', 'flex')
  $('#backDetailsM6').css('display', 'block')
})


$(".btnsDetM6 .clsbtnM6").click((e)=>{
  $('.detailsM6').css('display', 'none')
  $('#backDetailsM6').css('display', 'none')
})


$(".detbtnM6").click((e)=>{
  //","mailTemplate"
  let templates = ["portifolioV2","dailyLiturgy","bibleAPI","foodDev","chessGame","chatApp"]
  let objAtt = e.currentTarget.getAttribute("page");
  templates.includes(objAtt) ? window.location.href = "projects/"+objAtt+'.html' : alert("Em desenvolvimento");
})




//EASTER EGG
let easterList = [];
$("#logoImgM1").click(()=>{
  let randNumber;

  for (let x = 0; x<100; x++){
    
    randNumber = Math.floor(Math.random() * 20)
    if (!easterList.includes(randNumber)){
      easterList.push(randNumber)
      randNumber = 'easter/'+randNumber+'.jpg';
      break;
    }
    if (x==99){
      randNumber = 'imgs/logoIcon.jpg'
    }

  }
  
  $("#EasterEgg").append( `<div class="EasterImg bounce-in-top" 
  style="background-image: url('./static/${randNumber}');
  left: ${Math.floor(Math.random() * 100)}%;"
  ></div>`);

})
//

