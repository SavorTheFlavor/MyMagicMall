var WINDOW_WIDTH = 1224;
var WINDOW_HEIGHT = 568;

//小球
var ball = { x:931, y:100, r:59, vx:-5 , vy:-13, g:2 ,color:"#8B0A50"};

window.onload = function(){
    var canvas = document.getElementById("canvas");
    var context = canvas.getContext("2d");
    
    canvas.width = WINDOW_WIDTH;
    canvas.height = WINDOW_HEIGHT;
    
    setInterval(function(){
        render(context);
        update();
    },20);
};

function render(cxt){
    cxt.clearRect(0,0,WINDOW_WIDTH,WINDOW_HEIGHT);
    cxt.beginPath();
    cxt.arc(ball.x, ball.y ,ball.r,0,2*Math.PI);
    cxt.closePath();
    cxt.fill();
}
function update(){
    ball.x+=ball.vx;
    ball.y+=ball.vy;
    ball.vy+=ball.g;
    if(ball.y >= WINDOW_HEIGHT - ball.r){
        ball.y = WINDOW_HEIGHT - ball.r;
//        ball.vy = -ball.vy;
//加入摩擦系数
        ball.vy = -ball.vy*0.7;
    }
//    if(ball.y <= 30){
//        ball.y = 30;
//        ball.vy = -ball.vy;
//    }
    
}

