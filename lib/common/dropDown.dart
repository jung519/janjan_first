
// 청약 가산점 계산 - 무주택기간
class HomelessPeriodList{
  final int score;
  final String period;
  
  HomelessPeriodList(this.score, this.period);

  static List<HomelessPeriodList> getHomelessPeriod() {
    return <HomelessPeriodList>[
      HomelessPeriodList(0, '30세 미만 미혼 무주택자'),
      HomelessPeriodList(2, '1년 미만'),
      HomelessPeriodList(4, '1년 이상 ~ 2년 미만'),
      HomelessPeriodList(6, '2년 이상 ~ 3년 미만'),
      HomelessPeriodList(8, '3년 이상 ~ 4년 미만'),
      HomelessPeriodList(10, '4년 이상 ~ 5년 미만'),
      HomelessPeriodList(12, '5년 이상 ~ 6년 미만'),
      HomelessPeriodList(14, '6년 이상 ~ 7년 미만'),
      HomelessPeriodList(16, '7년 이상 ~ 8년 미만'),
      HomelessPeriodList(18, '8년 이상 ~ 9년 미만'),
      HomelessPeriodList(20, '9년 이상 ~ 10년 미만'),
      HomelessPeriodList(22, '10년 이상 ~ 11년 미만'),
      HomelessPeriodList(24, '11년 이상 ~ 12년 미만'),
      HomelessPeriodList(26, '12년 이상 ~ 13년 미만'),
      HomelessPeriodList(28, '13년 이상 ~ 14년 미만'),
      HomelessPeriodList(30, '14년 이상 ~ 15년 미만'),
      HomelessPeriodList(32, '15년 이상')
    ];
  }
}

// 청약 가산점 계산 - 부양가족 인원 수 
class PeopleCountList {
  final int count;
  final String peopleCount;

  PeopleCountList(this.count, this.peopleCount);

  static List<PeopleCountList> getPeopleConutList(){
    return <PeopleCountList>[
      PeopleCountList(0, '0명'),
      PeopleCountList(1, '1명'),
      PeopleCountList(2, '2명'),
      PeopleCountList(3, '3명'),
      PeopleCountList(4, '4명'),
      PeopleCountList(5, '5명'),
      PeopleCountList(6, '6명 이상')
    ];
  }
}