package {


import com.greensock.TweenLite;

import flash.display.Bitmap;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.media.Sound;
import flash.text.TextField;
import flash.utils.Timer;


public class DotGameMain extends Sprite{

    [Embed(source='nen.png')]
    private const Square:Class;
    [Embed(source='img/bg 2.png')]
    private const BACK_GROUND:Class;
    [Embed(source='img/khung.png')]
    private const KHUNG:Class;
    [Embed(source='../MainMenu/sound/ButtonClick.mp3')]
    private const SoundClick:Class;

    [Embed(source='img/re.png')]
    private const finalQ:Class;
    public var moveSound:Sound = new SoundClick();

    public var arrayDot:Array = [];
    public var arraySquare:Array = [];
    public var previousId:int;
    public var bg:Bitmap = new BACK_GROUND();

    public var IdGame:int = 3;

    public function DotGameMain() {
        bg = SDUtils.getFitImage(bg, Consts.GAME_WIDTH, Consts.GAME_HEIGHT);
        addChild(bg);

        var khung_play:DisplayObject = new KHUNG();
        khung_play.x = bg.x + (bg.width - khung_play.width)/2;
        khung_play.y = bg.y + bg.height/2 + 50;
        addChild(khung_play);

        var tuto:CuztomText = new CuztomText(70, 0xfcf003, "MAKE IT BECOME");
        tuto.x = bg.x + (bg.width - tuto.width)/2 + 200;
        tuto.y = bg.y + 20;
        addChild(tuto);

        var FAnswer:DisplayObject = new finalQ();
        FAnswer.x = bg.x + (bg.width - FAnswer.width)/2;
        FAnswer.y = tuto.y + tuto.height + 10;
        addChild(FAnswer);

        for(var i:int =0 ;i < 7; i++){
            var square:SquareBox = new SquareBox(i);
            square.x = khung_play.x + (khung_play.width - square.width)/2 - (square.width -20) * 3 + (square.width - 20) * i ;
            square.y = khung_play.y + (khung_play.height - square.height)/2;
            addChild(square);
            arraySquare.push(square);
            square.addEventListener(MouseEvent.CLICK, onClickSquare);
        }

        for(var i:int =0; i< 7; i++){
            if(i < 3){
                var circleDot:LeftCircle = new LeftCircle(i);
                circleDot.scaleY = circleDot.scaleX = 1.1;
                circleDot.x = arraySquare[i].middeDotPosX = arraySquare[i].x + (arraySquare[i].width - circleDot.width)/2;
                circleDot.y = arraySquare[i].middeDotPosY = arraySquare[i].y + (arraySquare[i].height - circleDot.height)/2;
                arraySquare[i].isEmpty = false;
                arrayDot.push(circleDot);
                addChild(circleDot);
                circleDot.addEventListener(MouseEvent.CLICK, onClickCircle);
            } else if(i > 3){
                var circleDot2:RightCircle = new RightCircle(i);
                circleDot2.scaleY = circleDot2.scaleX = 1.1;
                circleDot2.x = arraySquare[i].middeDotPosX = arraySquare[i].x + (arraySquare[i].width - circleDot2.width)/2;
                circleDot2.y = arraySquare[i].middeDotPosY = arraySquare[i].y + (arraySquare[i].height - circleDot2.height)/2;
                arraySquare[i].isEmpty = false;
                arrayDot.push(circleDot2);
                addChild(circleDot2);
                circleDot2.addEventListener(MouseEvent.CLICK, onClickCircle);
            } else{
                var circleDotNull:RightCircle = new RightCircle(i);
                circleDotNull.scaleY = circleDotNull.scaleX = 1.1;
                circleDotNull.x = arraySquare[i].middeDotPosX = arraySquare[i].x + (arraySquare[i].width - circleDotNull.width)/2;
                circleDotNull.y = arraySquare[i].middeDotPosY = arraySquare[i].y + (arraySquare[i].height - circleDotNull.height)/2;
                arraySquare[i].isEmpty = true;
            }
        }
    }

    function delayedFunctionCall(delay:int, func:Function) {
        trace('going to execute the function you passed me in', delay, 'milliseconds');
        var timer:Timer = new Timer(delay, 1);
        timer.addEventListener(TimerEvent.TIMER, func);
        timer.start();
    }

    public function checkBoxNotNull(spri:Object, box:Object):Boolean{
        if(spri.x > box.x && spri.x < (box.x + box.width) && spri.y > box.y && spri.y < (box.y + box.height)){
            return true;
        } else return false;
    }

    public function getCurrentSquare(dot:Object):Object{
        var id:int;
        for(var j:int =0; j< arraySquare.length; j++){
            if(checkBoxNotNull(dot, arraySquare[j])){
                id = j;
            }
        }
        return arraySquare[id];
    }

    public function onClickCircle(e:MouseEvent):void{
        if(e.target.clickEnable){
            moveSound.play();
            getCurrentSquare(e.target).isEmpty = true;
            previousId = getCurrentSquare(e.target).id;
            e.target.isClicked = true;
            TweenLite.to(e.target, 0.3, {y:(e.target.y - 160) });
        }
        disableClickDot(arrayDot);
    }

    public function enableClickDot(arr:Array):void{
        for(var i:int = 0; i < arr.length; i++){
            arr[i].clickEnable = true;
        }
    }
    public function disableClickDot(arr:Array):void{
        for(var i:int = 0; i < arr.length; i++){
            arr[i].clickEnable = false;
        }
    }

    public function onClickSquare(e:MouseEvent):void{
        if(e.target.isEmpty){
            moveSound.play();
            for(var i:int = 0; i < arrayDot.length; i++){
                if(arrayDot[i].isClicked){
                    if(arrayDot[i].id < 3){
                        if(arrayDot[i].x <= e.target.middeDotPosX + 1){
                            if(e.target.middeDotPosX - arrayDot[i].x < 5){
                                TweenLite.to(arrayDot[i], 0.3, {y:e.target.middeDotPosY});
                                e.target.isEmpty = false;
                            } else{
                                TweenLite.to(arrayDot[i], 0.8, {x:e.target.middeDotPosX});
                                delayedFunctionCall(300, function (event:Event):void {
                                    TweenLite.to(arrayDot[i], 0.3, {y:e.target.middeDotPosY})
                                });
                                updatePosBeforeCheckWin(arrayDot[i], e.target.middeDotPosX);
                                getCurrentSquare(arrayDot[i]).isEmpty = false;
                                arraySquare[previousId].isEmpty = true;
                            }
                            arrayDot[i].isClicked = false;
                            enableClickDot(arrayDot);
                            break;
                        }
                    } else {
                        if(arrayDot[i].x >= e.target.middeDotPosX - 1){
                            if(arrayDot[i].x  - e.target.middeDotPosX < 5){
                                TweenLite.to(arrayDot[i], 0.3, {y:e.target.middeDotPosY});
                                e.target.isEmpty = false;
                            } else {
                                TweenLite.to(arrayDot[i], 0.8, {x:e.target.middeDotPosX});
                                delayedFunctionCall(300, function (event:Event):void {
                                    TweenLite.to(arrayDot[i], 0.3, {y:e.target.middeDotPosY})
                                });
                                updatePosBeforeCheckWin(arrayDot[i], e.target.middeDotPosX);
                                getCurrentSquare(arrayDot[i]).isEmpty = false;
                                arraySquare[previousId].isEmpty = true;
                            }
                            arrayDot[i].isClicked = false;
                            enableClickDot(arrayDot);
                            break;
                        }
                    }
                }
            }
        }
        checkWin();
    }

    function updatePosBeforeCheckWin(obj:Object, x:int){
        obj.x = x;
    }

    public function checkWin():void{
        if(arrayDot[0].x > arraySquare[3].middeDotPosX
                && arrayDot[1].x > arraySquare[3].middeDotPosX
                && arrayDot[2].x > arraySquare[3].middeDotPosX
                && arrayDot[3].x < arraySquare[3].middeDotPosX
                && arrayDot[4].x < arraySquare[3].middeDotPosX
                && arrayDot[5].x < arraySquare[3].middeDotPosX){
            var winPU:PopUpWin = new PopUpWin(IdGame);
            winPU.x = bg.x + (bg.width - winPU.width)/2;
            winPU.y = bg.y + (bg.height - winPU.height)/2;
            delayedFunctionCall(700, function (event:Event):void {
                addChild(winPU);
            });
            return;
        }
    }
}
}
