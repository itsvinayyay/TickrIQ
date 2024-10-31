class EarningCalendarModel {
  String? pricedate;
  String? ticker;
  double? actualEps;
  double? estimatedEps;
  int? actualRevenue;
  int? estimatedRevenue;

  EarningCalendarModel(
      {this.pricedate,
      this.ticker,
      this.actualEps,
      this.estimatedEps,
      this.actualRevenue,
      this.estimatedRevenue});

  EarningCalendarModel.fromJson(Map<String, dynamic> json) {
    pricedate = json['pricedate'];
    ticker = json['ticker'];
    actualEps = json['actual_eps'];
    estimatedEps = json['estimated_eps'];
    actualRevenue = json['actual_revenue'];
    estimatedRevenue = json['estimated_revenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pricedate'] = this.pricedate;
    data['ticker'] = this.ticker;
    data['actual_eps'] = this.actualEps;
    data['estimated_eps'] = this.estimatedEps;
    data['actual_revenue'] = this.actualRevenue;
    data['estimated_revenue'] = this.estimatedRevenue;
    return data;
  }
}
