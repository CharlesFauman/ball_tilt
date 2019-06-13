import android.app.Activity;
import android.content.Context;
import android.os.Vibrator;

Activity act;
Vibrator vibrer;
 
void setup_vibration(){
  //requestPermission("android.permission.VIBRATE", "initPerms");
  act = this.getActivity();
  vibrer = (Vibrator)   act.getSystemService(Context.VIBRATOR_SERVICE);
}

void initPerms(boolean granted){
  if (granted) {   
    println("yay");
  } else {
    println("boo");
  }
}
