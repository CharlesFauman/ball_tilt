import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
AccelerometerListener listener;
float ax, ay, az;

class AccelerometerListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    ax = floor(event.values[0] * 10) / 10;
    ay = floor(event.values[1] * 10) / 10;
    az = floor(event.values[2] * 10) / 10; 
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}
