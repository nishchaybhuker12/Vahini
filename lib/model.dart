class MLReply {
  MLReply({
    required this.reply,
  });
  late final String reply;

  MLReply.fromJson(Map<String, dynamic> json){
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['reply'] = reply;
    return _data;
  }
}