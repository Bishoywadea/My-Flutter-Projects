class Graph{
  static DateTime unixToNormal(int unixFormat){
    return DateTime.fromMillisecondsSinceEpoch(unixFormat * 1000);
  }
}

class Rank {
  late final int rank;
  late DateTime date;
  Rank({required this.rank, required this.date}) {}
}