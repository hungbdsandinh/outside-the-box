package {
import flash.data.EncryptedLocalStore;
import flash.utils.ByteArray;

public class Utils {
    public function Utils() {
    }

    public static function saveLocalStorage(k:String, v:String):void {
        var bytes:ByteArray = new ByteArray();
        bytes.writeUTFBytes(v);
        EncryptedLocalStore.setItem(k, bytes);
    }

    public static function getLocalStorage(k:String):* {
        var storedValue:ByteArray = EncryptedLocalStore.getItem(k);
        if (storedValue != null) {
            return storedValue.readUTFBytes(storedValue.length)
        } else {
            return null;
        }
    }
}
}
