package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;

public class NopePopUp extends Sprite{

    [Embed(source='CSS/THONG-BAO.png')]
    private const BG:Class;

    public var bg:Bitmap = new BG();
    public function NopePopUp() {
        var sprite:Sprite = new Sprite();
        sprite.graphics.clear();
        sprite.graphics.beginFill(0xD4D4D4, .2);
        sprite.graphics.drawRect(0,0, Consts.GAME_WIDTH,Consts.GAME_HEIGHT);
        sprite.graphics.endFill();
        addChild(sprite);
        bg.x = sprite.x + (sprite.width - bg.width)/2;
        bg.y = sprite.y + (sprite.height - bg.height)/2;
        addChild(bg);
        var customText:CuztomText = new CuztomText(70, 0xcc99ff, "Level is locked xD");
        customText.x = bg.x + (bg.width)/2 - 50;
        customText.y = bg.y + (bg.height - customText.height)/2;
        addChild(customText);
    }
}
}
