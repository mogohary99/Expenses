
import 'package:expenses/core/constants/assets_manager.dart';

extension IconsExtensions on String{
  String get toIcon{
    switch(this){
      case 'Shopping':
        return AppIcons.shoppingIcon;
      case 'Wellness':
        return AppIcons.wellnessIcon;
      case 'Transport':
        return AppIcons.transportIcon;
      case 'Bars & Restaurant':
        return AppIcons.barsIcon;
      case 'Subscriptions':
        return AppIcons.subscriptionsIcon;
      default:
        return AppIcons.shoppingIcon;
    }
  }
}