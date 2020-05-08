package {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;


[SWF(width=920, height=620)]
public class Bubble1Main extends Sprite {

    [Embed(source='nen.png')]
    private const Square:Class;
    [Embed(source='hong.png')]
    private const Circle:Class;



    public var arrCircle:Array = [];

    public var minDis:int;



    public function Bubble1Main() {
        var square:DisplayObject = new Square();
        square.scaleX = square.scaleY = 1.1;
        addChild(square);
        for (var i:int = 0; i < 9; i++) {
            var circleOne:CircleDraw = new CircleDraw(i);
            if (i < 3) {
                circleOne.x = 5 + circleOne.width * i;
                circleOne.y = 5;
            } else if (3 <= i && i < 6) {
                circleOne.x = 5 + circleOne.width * (i - 3);
                circleOne.y = 5 + circleOne.height;
            } else {
                circleOne.x = 5 + circleOne.width * (i - 6);
                circleOne.y = (5 + circleOne.height) * 2;
            }
            circleOne.center.x = (circleOne.x + circleOne.width)/2;
            circleOne.center.y = (circleOne.y + circleOne.height)/2;
            trace("vong tron so" +  i.toString() + "   " + circleOne.center.x + "   " + circleOne.center.y);

            arrCircle.push(circleOne);
            addChild(circleOne);
        }

        trace(arrCircle[1].center.x + "   " + arrCircle[0].center.x);

        minDis = arrCircle[0].width;


        var tenthCircle:CircleDraw = new CircleDraw(9);
        tenthCircle.x = square.x + square.width+ 30;
        tenthCircle.y = square.y + 30;
        tenthCircle.center.x = (tenthCircle.x + tenthCircle.width)/2;
        tenthCircle.center.y = (tenthCircle.y + tenthCircle.height)/2;

        trace(minDis + "duong kinh");

        arrCircle.push(tenthCircle);
        addChild(tenthCircle);

        for (var i:int = 0; i < arrCircle.length; i++) {
            arrCircle[i].addEventListener(MouseEvent.MOUSE_DOWN, mouseDown)
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
        sprite.center.x = (dragged.x + dragged.width)/2;
        sprite.center.y = (dragged.y + dragged.height)/2;
    }


    function mouseReleased(event:MouseEvent):void
    {
        dragged.stopDrag();
        var targetArr:Array = [];
        splitArray(event.target.id, arrCircle, targetArr);
        for(var j:int = 0; j < targetArr.length; j++){
            if(!event.target.isCollision){
                if(checkCollision(dragged, targetArr[j].center)){
                    trace("dragged pos" + dragged.x + "  " + dragged.y + " and target " + targetArr[j].center.x + "   " + targetArr[j].center.y );
                    event.target.addChild(event.target.circleF);
                    event.target.isCollision = true;
                    break;
                }
            } else {
                if(!checkCollision(dragged, targetArr[j].center)){
                    trace("collision new x" + dragged.x + "  " + dragged.y );
                    event.target.removeChild(event.target.circleF);
                    updatePos(event.target);
                    event.target.isCollision = false;
                }
            }
        }
        updatePos(event.target);
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
        x = (firstObject.x + firstObject.width)/2;
        y = (firstObject.y + firstObject.height)/2;
        var a:int = secondObject.x;
        var b:int = secondObject.y;

        var distance:int = Math.sqrt( ( x - a) * ( x - a ) + ( y - b ) * ( y - b) );
        trace(distance + " ID");
        if(distance < 59){
            return true;
        } else return false;
    }

}
}
