package {
import flash.display.DisplayObject;
import flash.display.Sprite;

public class SquareBox extends Sprite{
    [Embed(source='img/xam.png')]
    private const Square:Class;
    [Embed(source='img/do.png')]
    private const SquareRed:Class;
    [Embed(source='img/vang.png')]
    private const SquareGreen:Class;

    public var isEmpty:Boolean;

    public var id:int;

    public var middeDotPosX:int;
    public var middeDotPosY:int;

    public var square1:DisplayObject = new Square();
    public var squareRed:DisplayObject = new SquareRed();
    public var squareGreen:DisplayObject = new SquareGreen();
    public function SquareBox(i:int) {
        id = i;
        if(id < 3){
            addChild(squareRed);
        } else if(id > 3){
            addChild(squareGreen)
        }else {
            addChild(square1);
        }
    }
}
}
