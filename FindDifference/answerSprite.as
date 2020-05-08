package {
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class answerSprite extends Sprite{

    [Embed(source='../MainMenu/CSS/v.png')]
    private const V_tick:Class;


    public var tickRight:DisplayObject = new V_tick();

    public var id:int;
    public var isClicked:Boolean = false;
    public function answerSprite(i:int) {
        id = i;
        addChild(tickRight);
        graphics.clear();
        graphics.beginFill(0x5D527D, 0); // grey color
        graphics.drawRect(tickRight.x, tickRight.y, tickRight.width, tickRight.height);
        graphics.endFill();
        addEventListener(MouseEvent.MOUSE_DOWN, onClick);
        tickRight.visible = false;
    }

    function onClick(e:MouseEvent):void{
        tickRight.visible = true;
        removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
    }
//
//    function onClickTick(e:MouseEvent):void{
//        tickRight.visible = true;
//        isClicked = true;
//        removeEventListener(MouseEvent.CLICK, onClickTick);
//        trace("a");
//    }
}
}
