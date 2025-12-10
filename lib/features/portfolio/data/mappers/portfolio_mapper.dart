import '../generated/portfolio.pb.dart' as pb;
import '../../domain/portfolio_model.dart';
import 'asset_mapper.dart';

/// Extension to convert proto Portfolio to domain PortfolioModel
extension PortfolioMapper on pb.Portfolio {
  PortfolioModel toDomain() => PortfolioModel(
    id: id,
    name: name,
    assets: assets.map((a) => a.toDomain()).toList(),
    totalValue: totalValue,
    totalPercentChange: totalPercentChange,
  );
}
