package {
import flash.display.DisplayObject;
import flash.display.Sprite;

public class DiemDocObj extends Sprite{

    [Embed(source='diemdoc.png')]
    private const Match:Class;

    [Embed(source='diemdocgay.png')]
    private const BreakMatch:Class;

    public var match:DisplayObject = new Match();
    public var matchBreak:DisplayObject = new BreakMatch();

    public var isBreak:Boolean = true;

    public var id:int;

    public function DiemDocObj(i:int) {
        id = i;
        addChild(match);
    }
}
}
