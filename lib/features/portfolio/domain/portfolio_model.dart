import 'package:freezed_annotation/freezed_annotation.dart';

import 'asset_model.dart';

part 'portfolio_model.freezed.dart';
part 'portfolio_model.g.dart';

/// Immutable model representing a user's financial portfolio
@freezed
class PortfolioModel with _$PortfolioModel {
  const PortfolioModel._();

  const factory PortfolioModel({
    required String id,
    required String name,
    required List<AssetModel> assets,
    required double totalValue,
    required double totalPercentChange,
  }) = _PortfolioModel;

  factory PortfolioModel.fromJson(Map<String, dynamic> json) =>
      _$PortfolioModelFromJson(json);

  /// Returns true if portfolio is performing positively
  bool get isPositive => totalPercentChange >= 0;
}
