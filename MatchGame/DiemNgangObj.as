package {
import flash.display.DisplayObject;
import flash.display.Sprite;

public class DiemNgangObj extends Sprite{

    [Embed(source='diemngang.png')]
    private const Match:Class;

    [Embed(source='diemnganggay.png')]
    private const BreakMatch:Class;

    public var match:DisplayObject = new Match();
    public var matchBreak:DisplayObject = new BreakMatch();

    public var isBreak:Boolean = false;
    public var id:int;

    public function DiemNgangObj(i:int) {
        id = i;
        addChild(match);

    }
}
}
