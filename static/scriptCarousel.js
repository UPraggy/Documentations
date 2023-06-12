$(".carOpts .subOpts").click((e)=>{

    
    $(".carOpts .subOpts").css("background-color","#a6a6a6")
    e.currentTarget.style.backgroundColor = "#000"

    let actual_key = e.currentTarget.getAttribute("key")
    $(".carouselVideos video").removeClass("puff-in-center").css("display","none").trigger('pause');
    $(".carouselVideos video:nth-child("+actual_key+")").css("display", "block")
    .addClass("puff-in-center").trigger('play'); 
})

