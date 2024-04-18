class WalletData {
  final String walletId;
  final double balance;

  WalletData({required this.walletId, required this.balance});

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      walletId: json['wallet_id'],
      balance: double.parse(json['balance'].toString()),
    );
  }
}
