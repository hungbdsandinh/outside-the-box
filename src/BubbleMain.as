package {

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.media.Sound;
import flash.text.TextField;


[SWF(width=920, height=620)]
public class BubbleMain extends Sprite {

    [Embed(source='img/khung 1.png')]
    private const Square:Class;
    [Embed(source='img/bg 4.png')]
    private const BACK_GROUND:Class;
    [Embed(source='../MainMenu/sound/ButtonClick.mp3')]
    private const SoundClick:Class;
    public var moveSound:Sound = new SoundClick();

    public var IdGame:int = 5;

    public var arrCircle:Array = [];

    public var minDis:int;

    public var bg:Bitmap = new BACK_GROUND();
    public var khung_play:DisplayObject = new Square();
    public function BubbleMain() {
        bg = SDUtils.getFitImage(bg, Consts.GAME_WIDTH, Consts.GAME_HEIGHT);
        addChild(bg);

        khung_play.scaleX = khung_play.scaleY = .987;
        khung_play.y = bg.y + (bg.height - khung_play.height)/2;
        khung_play.x = bg.x + bg.width - khung_play.width - (bg.height - khung_play.height)/2;
        addChild(khung_play);
        trace("khung play x " + khung_play.x);

        for (var i:int = 0; i < 9; i++) {
            var circleOne:CircleDraw = new CircleDraw(i);
            if (i < 3) {
                circleOne.x = khung_play.x + 2 + circleOne.width * i;
                trace(circleOne.x + "   " + circleOne.width);
                trace((circleOne.x + circleOne.width)/2);
                circleOne.y = khung_play.y + 2;
            } else if (3 <= i && i < 6) {
                circleOne.x = khung_play.x + 2 + circleOne.width * (i - 3);
                circleOne.y = khung_play.y + 2 + circleOne.height;
            } else {
                circleOne.x = khung_play.x + 2 + circleOne.width * (i - 6);
                circleOne.y = khung_play.y + (2 + circleOne.height) * 2;
            }
            circleOne.center.x = circleOne.x + circleOne.width/2;
            circleOne.center.y = circleOne.y + circleOne.height/2;
            trace("vong tron so " +  i.toString() + "   " + circleOne.center.x + "   " + circleOne.center.y);

            arrCircle.push(circleOne);
            addChild(circleOne);
        }

        var khung_nho:DisplayObject = new Square();
        khung_nho.scaleX = khung_nho.scaleY = .35;
        khung_nho.x = khung_play.x - khung_nho.width - 30;
        khung_nho.y = khung_play.y + 50;
        addChild(khung_nho);

        var textt:CuztomText = new CuztomText(55, 0xf69339, "MOVE EVERY CIRCLE");
        textt.x = khung_nho.x - 150;
        textt.y = khung_nho.y + khung_nho.height + 50;
        addChild(textt);
        var textt1:CuztomText = new CuztomText(45, 0Xf7a26e, "INSIDE THE RIGHT SQUARE");
        textt1.x = khung_nho.x - 135;
        textt1.y = textt.y + textt.height + 10;
        addChild(textt1);

        minDis = arrCircle[0].width;


        var tenthCircle:CircleDraw = new CircleDraw(9);
        tenthCircle.x = khung_nho.x + (khung_nho.width - tenthCircle.width)/2;
        tenthCircle.y = khung_nho.y + (khung_nho.height - tenthCircle.height)/2;
        tenthCircle.center.x = tenthCircle.x + tenthCircle.width/2;
        tenthCircle.center.y = tenthCircle.y + tenthCircle.height/2;

        trace(tenthCircle.x + "t emth circle x " + tenthCircle.y);

        arrCircle.push(tenthCircle);
        addChild(tenthCircle);

        for (var i:int = 0; i < arrCircle.length; i++) {
            arrCircle[i].addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
            arrCircle[i].addEventListener(MouseEvent.MOUSE_UP, mouseReleased);
        }
    }

    var dragged:Sprite;

    function mouseDown(event:MouseEvent):void
    {
        dragged = Sprite(event.currentTarget);
        Sprite(dragged.parent).setChildIndex(dragged, Sprite(dragged.parent).numChildren - 1)
        dragged.startDrag();
    }

    function updatePos(sprite:Object){
        sprite.x = dragged.x;
        sprite.y = dragged.y;
        sprite.center.x = dragged.x + dragged.width/2;
        sprite.center.y = dragged.y + dragged.height/2;
    }


    function mouseReleased(event:MouseEvent):void {
        dragged.stopDrag();
        var targetArr:Array = [];
        splitArray(event.target.id, arrCircle, targetArr);
        for(var j:int = 0; j < targetArr.length; j++){
            if(!event.target.isCollision){
                if(checkCollision(dragged, targetArr[j].center)){
                    trace("dragged pos " + dragged.x + "  " + dragged.y + " and target " + targetArr[j].center.x + "   " + targetArr[j].center.y );
                    event.target.circleF.visible = true;
                    event.target.isCollision = true;
                    break;
                }
            } else {
                if(!checkCollision(dragged, targetArr[j].center)){
                    trace("collision new x" + dragged.x + "  " + dragged.y );
                    event.target.circleF.visible = false;
                    updatePos(event.target);
                    event.target.isCollision = false;
                }
            }
        }
        updatePos(event.target);
        checkWin();
        trace("end");
    }

    function splitArray(i:int,arr:Array,targetArr:Array):void{
        for(var j:int = 0; j < arr.length; j++){
            if(i != j){
                targetArr.push(arr[j]);
            }
        }
    }

    function checkCollision(firstObject:Object, secondObject:Object):Boolean {
        var x:int;
        var y:int;
        x = firstObject.x + firstObject.width/2;
        y = firstObject.y + firstObject.height/2;
        var a:int = secondObject.x;
        var b:int = secondObject.y;

        var distance:int = Math.sqrt( ( x - a) * ( x - a ) + ( y - b ) * ( y - b) );
        trace(distance + " ID" + secondObject.id);
        if(distance < 157){
            return true;
        } else return false;
    }

    function checkWin():void{
        var count:int = 0;
        if(checkAllCollision()){
            for each(var d:Object in arrCircle){
                if( (d.x > khung_play.x) && (d.x + d.width) < (khung_play.x + khung_play.width) && (d.y > khung_play.y) && (d.y + d.height) < (khung_play.y + khung_play.height)){
                    count++;
                }
            }
        }
        if(count == 10){
            var winPU:PopUpWin = new PopUpWin(IdGame);
            winPU.x = bg.x + (bg.width - winPU.width)/2;
            winPU.y = bg.y + (bg.height - winPU.height)/2;
            addChild(winPU);
            Utils.saveLocalStorage("pass-lv-" + (IdGame).toString(), "true");
        } else return;
    }

    function checkAllCollision():Boolean{
        var count:int = 0;
        for(var i:int=0; i < arrCircle.length; i ++){
            if(!arrCircle[i].isCollision){
                count++;
            }
        }
        if(count == 10){
            return true;
        } else return false;
    }
}
}
