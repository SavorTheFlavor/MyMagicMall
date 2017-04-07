/* global digits */

var WINDOW_WIDTH = 800;
var WINDOW_HEIGHT = 600;
var RADIUS = 1;
var MARGIN_LEFT = 80;
var MARGIN_TOP = 100;

var endTime = new Date();
endTime.setTime(new Date());
//endTime.setTime(endTime.getTime() + 5*1000);
var currentShowSeconds = 0;

var balls = [];
var colors = ["#33B5E5","#0099CC","#AA66CC","#9933CC","#99CC00","#669900","#FFBB33","#FF8800","#FF4444","#CC0000"];

var isGonnaTerminate = false;

window.onload = function(){
    var canvas = document.getElementById("canvas");
    var context = canvas.getContext("2d");
    
    WINDOW_WIDTH = document.body.clientWidth;
    WINDOW_HEIGHT = document.documentElement.clientHeight - 40;
    MARGIN_LEFT = Math.round(WINDOW_WIDTH*0.68);
    MARGIN_TOP = Math.round(WINDOW_HEIGHT/50);
    
    //RADIUS = Math.round( WINDOW_WIDTH*4/5/108)-1;
    
    canvas.width = WINDOW_WIDTH;
    canvas.height = WINDOW_HEIGHT;
    currentShowSeconds = getCurrentShowTimeSeconds();
    setInterval(function(){
        render(context);
        update(context);
    },50);

};

function getCurrentShowTimeSeconds(){
//    var curTime = endTime.getTime() - (new Date()).getTime();
//    var ret = Math.round(curTime/1000);
    return Math.round(new Date().getTime()/1000+8*3600)%(24*60*60);
}

function update(){
    
    var nextShowTimeSeconds = getCurrentShowTimeSeconds();
    
    var nextHours = parseInt(nextShowTimeSeconds/3600);
    var nextMinutes = parseInt((nextShowTimeSeconds - 3600*nextHours)/60);
    var nextSeconds = parseInt(nextShowTimeSeconds%60);
    
    
    var curHours = parseInt(currentShowSeconds/3600);
    var curMinutes = parseInt((currentShowSeconds - 3600*curHours)/60);
    var curSeconds = parseInt(currentShowSeconds%60);
    
    if(nextShowTimeSeconds != currentShowSeconds){
       
        if(parseInt(nextHours/10) != parseInt(curHours/10)){
            addBall(MARGIN_LEFT,MARGIN_TOP,parseInt(curHours/10));
        }
        if(parseInt(nextHours%10) != parseInt(curHours%10)){
            addBall(MARGIN_LEFT + 15*(RADIUS+1),MARGIN_TOP,parseInt(curHours%10));
        }
        if(parseInt(nextMinutes/10) != parseInt(curMinutes/10)){
            addBall(MARGIN_LEFT + 39*(RADIUS+1),MARGIN_TOP,parseInt(curMinutes/10));
        }
        if(parseInt(nextMinutes%10) != parseInt(curMinutes%10)){
            addBall(MARGIN_LEFT + 54*(RADIUS+1),MARGIN_TOP,parseInt(curMinutes%10));
        }
        if(parseInt(nextSeconds/10) != parseInt(curSeconds/10)){
            addBall(MARGIN_LEFT + 78*(RADIUS+1),MARGIN_TOP,parseInt(curSeconds/10));
        }
        if(parseInt(nextSeconds%10) != parseInt(curSeconds%10)){
            addBall(MARGIN_LEFT + 93*(RADIUS+1),MARGIN_TOP,parseInt(curSeconds%10));
        }
         currentShowSeconds = nextShowTimeSeconds;
    }
    updateBalls();
}


function updateBalls(){
    for (var i = 0; i<balls.length; i++){
        balls[i].x += balls[i].vx;
        balls[i].y += balls[i].vy;
        balls[i].vy += balls[i].g;
        if(balls[i].y >= WINDOW_HEIGHT - RADIUS){
            balls[i].y = WINDOW_HEIGHT - RADIUS;
            balls[i].vy = -balls[i].vy*0.73;
        }
    }
    var cnt = 0;
    for (var i = 0; i<balls.length; i++){
        if(balls[i].x >0 && balls[i].x < WINDOW_WIDTH){
            balls[cnt++] = balls[i];
        }
    }
    while(balls.length > cnt){
        balls.pop();
    }
    
}

function addBall(x,y,num){
    for (var i = 0; i<digits[num].length; i++){
        for (var j = 0; j<digits[num][i].length; j++){
            if(digits[num][i][j] == 1){
                var aBall = {
                    x:x + j*2*(RADIUS + 1)+ (RADIUS + 1),
                    y:y + i*2*(RADIUS + 1)+ (RADIUS + 1),
                    g:0.7+Math.random()*2,//gravity
                    vx:Math.pow(-1,Math.ceil(Math.random()*1000))*3,
                    vy:-(Math.floor(Math.random()*10)+1),
                    color:colors[Math.floor(Math.random()*colors.length)]
                };
                balls.push(aBall);
            }
        }
    }
}

function render(cxt){
    cxt.clearRect(0,0,WINDOW_WIDTH,WINDOW_HEIGHT);
    
    var hours = parseInt(currentShowSeconds/3600);
    var minutes = parseInt((currentShowSeconds - 3600*hours)/60);
    var seconds = parseInt(currentShowSeconds%60);
    
    renderDigit(MARGIN_LEFT,MARGIN_TOP,parseInt(hours/10),cxt);
    renderDigit(MARGIN_LEFT + 15*(RADIUS+1),MARGIN_TOP,parseInt(hours%10),cxt);
    renderDigit(MARGIN_LEFT + 30*(RADIUS+1),MARGIN_TOP,10,cxt);
    renderDigit(MARGIN_LEFT + 39*(RADIUS+1),MARGIN_TOP,parseInt(minutes/10),cxt);
    renderDigit(MARGIN_LEFT + 54*(RADIUS+1),MARGIN_TOP,parseInt(minutes%10),cxt);
    renderDigit(MARGIN_LEFT + 69*(RADIUS+1),MARGIN_TOP,10,cxt);
    renderDigit(MARGIN_LEFT + 78*(RADIUS+1),MARGIN_TOP,parseInt(seconds/10),cxt);
    renderDigit(MARGIN_LEFT + 93*(RADIUS+1),MARGIN_TOP,parseInt(seconds%10),cxt);
    
    //render balls
    for(var i = 0; i<balls.length; i++){
        cxt.fillStyle = balls[i].color;
        cxt.beginPath();
        cxt.arc(balls[i].x,balls[i].y,RADIUS+1,0,2*Math.PI);
        cxt.closePath();
        cxt.fill();
    }
    
}

function renderDigit(x,y,num,cxt){
    cxt.fillStyle = "rgba(0,102,153,0.9)";
    for (var i = 0 ; i < digits[num].length; i++){
        for (var j = 0; j< digits[num][i].length; j++){
            if(digits[num][i][j] == 1){
                cxt.beginPath();
                cxt.arc(x + j*2*(RADIUS + 1)+ (RADIUS + 1), y + i*2*(RADIUS + 1)+ (RADIUS + 1),RADIUS,0,2*Math.PI);
                cxt.closePath();
                cxt.fill();
            }
        }
    }
}


