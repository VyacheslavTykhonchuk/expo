package expo.modules.firebase.app;

import android.content.Context;

import java.util.Collections;
import java.util.List;

import expo.core.ExportedModule;
import expo.core.BasePackage;

public class FirebaseAppPackage extends BasePackage {
  @Override
  public List<ExportedModule> createExportedModules(Context context) {
    return Collections.<ExportedModule>singletonList(new FirebaseAppModule(context));
  }
}
