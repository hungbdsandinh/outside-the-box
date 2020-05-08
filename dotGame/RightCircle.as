package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class RightCircle extends Sprite{

    [Embed(source='img/kim cuong 2.png')]
    private const CircleFail:Class;

    public var id:int;
    public var clickEnable:Boolean = true;

    public var isClicked:Boolean = false;
    public var circleF:DisplayObject = new CircleFail();
    public var center = {
        x:int,
        y:int
    };

    public function RightCircle(i:int) {
        id = i;
        addChild(circleF);
    }
}
}
