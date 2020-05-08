package {
import com.greensock.TimelineMax;
import com.greensock.TweenLite;
import com.greensock.TweenMax;
import com.greensock.easing.Bounce;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Timer;

[SWF(width=920, height=620)]
public class MatchGameMain extends Sprite{


    public var arrDiemDoc:Array = [];
    public var arrDiemNgang:Array = [];

    public var moveCount:int = 6;
    var textPoint:TextField = new TextField();


    public function MatchGameMain() {

        var diem1:DiemDocObj = new DiemDocObj(100);
        var longDiem:int = diem1.height;
        var thinDiem:int = diem1.width;

        for(var i:int = 0; i < 9; i++){
            var diemNgang:DiemNgangObj = new DiemNgangObj(i);
            if (i < 3) {
                diemNgang.x = 5 + thinDiem + (diemNgang.width + thinDiem)  * i;
                diemNgang.y = 5;
            } else if (3 <= i && i < 6) {
                diemNgang.x = 5 + thinDiem+ (diemNgang.width + thinDiem) * (i - 3);
                diemNgang.y = 5 + longDiem;
            } else {
                diemNgang.x = 5 + thinDiem + (diemNgang.width + thinDiem) * (i - 6);
                diemNgang.y = (5 + longDiem) * 2;
            }

            diemNgang.addEventListener(MouseEvent.CLICK, breakMatch);

            arrDiemNgang.push(diemNgang);
            addChild(diemNgang);
        }

        for(var i:int = 0; i < 8; i++){
            var diemDoc:DiemDocObj = new DiemDocObj(i);
            if (i < 4) {
                diemDoc.x = 5 + (diemDoc.width + longDiem) * i;
                diemDoc.y = thinDiem;
            } else {
                diemDoc.x = 5 + (diemDoc.width + longDiem) * (i - 4);
                diemDoc.y = 5 +thinDiem + longDiem;
            }

            diemDoc.addEventListener(MouseEvent.CLICK, breakMatch);

            arrDiemDoc.push(diemDoc);
            addChild(diemDoc);
        }

        var style:TextFormat = new TextFormat();
        style.size = 30;
        style.color = 0x000000;

        textPoint.text = moveCount.toString();
        textPoint.x = 100;
        textPoint.y = 350;
        textPoint.setTextFormat(style);
        addChild(textPoint);


    }

    function delayedFunctionCall(delay:int, func:Function) {
        trace('going to execute the function you passed me in', delay, 'milliseconds');
        var timer:Timer = new Timer(delay, 1);
        timer.addEventListener(TimerEvent.TIMER, func);
        timer.start();
    }

    function breakMatch(e:MouseEvent):void{
        e.target.addChild(e.target.matchBreak);
        e.target.removeChild(e.target.match);
        e.target.isBreak = true;
        delayedFunctionCall(1000, function (event:Event) {
            fadeAway(e.target.matchBreak)
        });
        moveCount -=1;
        updatePoint();
        e.target.removeEventListener(MouseEvent.CLICK, breakMatch);
        checkWin();
    }

    function updatePoint(){
        textPoint.text = moveCount.toString();
    }

    function fadeAway(obj:Object){
        TweenLite.to(obj, .4, {alpha: 0});
    }

    function checkWin(){
        if(moveCount == 0){
            for(var i:int = 0; i < arrDiemNgang.length; i++){
                for(var j:int = 0; j < arrDiemDoc.length; j++){
                    if(arrDiemNgang[3].isBreak && arrDiemNgang[4].isBreak && arrDiemDoc[1].isBreak && arrDiemDoc[5].isBreak){
                        if(arrDiemNgang[2].isBreak && arrDiemDoc[3].isBreak){
                            trace("you win bro");
                            break;
                        } else if (arrDiemNgang[8].isBreak && arrDiemDoc[7].isBreak){
                            trace("you win bro");
                            break;
                        } else {
                            trace("y fuking lose");
                        }
                    } else {
                        trace("y fucking lose");
                    }
                }
            }
        }
    }
}
}
