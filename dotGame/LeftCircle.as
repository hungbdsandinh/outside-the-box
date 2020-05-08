package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class LeftCircle extends Sprite{

    [Embed(source='img/kim cuong 1.png')]
    private const Circle:Class;


    public var isClicked:Boolean = false;
    public var id:int;
    public var clickEnable:Boolean = true;

    public var circle1:DisplayObject = new Circle();

    public function LeftCircle(i:int) {
        id = i;
        addChild(circle1);
    }
}
}
