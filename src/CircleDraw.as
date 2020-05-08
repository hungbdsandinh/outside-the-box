package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class CircleDraw extends Sprite{

    [Embed(source='img/tron-2.png')]
    private const Circle:Class;
    [Embed(source='img/tron-1.png')]
    private const CircleFail:Class;

    public var id:int;

    public var isCollision:Boolean = false;

    public var circle1:DisplayObject = new Circle();
    public var circleF:DisplayObject = new CircleFail();
    public var center = {
        x:int,
        y:int
    };

    public function CircleDraw(i:int) {
        id = i;
        addChild(circle1);
        addChild(circleF);
        circleF.visible = false;
    }
}
}
