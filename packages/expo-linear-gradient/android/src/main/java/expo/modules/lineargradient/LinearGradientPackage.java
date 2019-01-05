package expo.modules.lineargradient;

import android.content.Context;

import java.util.Collections;
import java.util.List;

import expo.core.BasePackage;
import expo.core.ViewManager;

public class LinearGradientPackage extends BasePackage {
  @Override
  public List<ViewManager> createViewManagers(Context context) {
    return Collections.singletonList((ViewManager) new LinearGradientManager());
  }
}
