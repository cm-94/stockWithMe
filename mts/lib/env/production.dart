
import 'environment.dart';
// 운영
main() => Environment.newInstance(buildType: BuildType.production).run();