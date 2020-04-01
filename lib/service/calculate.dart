DateTime getDateTime(date) {
  var _arrDate = date.split("-");
  return DateTime(int.parse(_arrDate[0]),int.parse(_arrDate[1]),int.parse(_arrDate[2]));
}

// 부양가족수 계산
class NumOfDependents {
  int partner = 0;
  int people_1 = 0;
  int people_2 = 0;
  int people_3 = 0;
  int _count = 0;
  int _score = 0;
  int get count {
    this._count = partner + people_1 + people_2 + people_3;
    return _count;
  }
  int get score {
    this._score = (partner + people_1 + people_2 + people_3) * 5;
    if (this._score > 35) {
      this._score = 35;
    }
    return _score;
  }

  NumOfDependents({this.partner, this.people_1, this.people_2, this.people_3});
}

// 청약통장 가입일 계산
class SubscriptionDateScore {
  DateTime selectedDateTime;
  final today = DateTime.now();
  String selectedDate = '';
  int duration = 0;
  int _score = 0;
  final getYearToDays = 360;

  int get score {
    if (this.selectedDate == '')return 0;
    this.selectedDateTime = getDateTime(this.selectedDate);
    this.duration = this.today.difference(this.selectedDateTime).inDays;

    if (this.duration < 180) {
      this._score = 1;
    }else if (this.duration >= 180 && this.duration < 360) {
      this._score = 2;
    }else if (this.duration >= 360 && this.duration < getYearToDays*15) {
      for (var i = 1; i < 16; i++) {
        if(this.duration >= getYearToDays*i && this.duration < getYearToDays*(i+1)){
          this._score = 2 + i;
        }
      }
    }else{
      this._score = 17;
    }

    return this._score;
  }

  SubscriptionDateScore({this.selectedDate});
}

// 청약가점 총 합계 계산
class TotalAdditionalPoint {
  int homeLessPeriod = 0 ;
  int numOfDependents = 0;
  int accountScore = 0;
  int get totalScore {
    return this.homeLessPeriod + this.numOfDependents + this.accountScore;
  }

  TotalAdditionalPoint({this.homeLessPeriod, this.numOfDependents, this.accountScore});
}


// 무주택기간 계산
/**
 * 입주자 공고일 현제 무주택자여야 함.
 * 30세를 기산점으로 함
 * 만30세 부터 입주자 공고일까지의 날자를 계산.
 * 미혼이고 30세 이하인 경우 0점.
 * 단, 30세 이하인데 결혼한경우 혼인신고한 날을 기산점으로 함
 */

class HomelessDate {
  String announcementDate;
  final today = DateTime.now();
  String birthDay;
  DateTime _birthDay;
  int age;
  String marriageDate;
  String startedHomeless;
  DateTime referenceDate;

  int get duration {
    this._birthDay = getDateTime(this.birthDay);
    this.age = (this.today.difference(this._birthDay).inDays ~/ 360);
    if (this.age >= 30) {
      this.referenceDate = DateTime(_birthDay.year + 30, _birthDay.month, _birthDay.day);
    } else {
      if(marriageDate != null) {
        this.referenceDate = getDateTime(this.marriageDate);
      } else {
        return 0;
      }
    }

    if(this.startedHomeless != null && this.startedHomeless != '') {
      var _startedHomelessDate = getDateTime(this.startedHomeless);
      var differenceDate = this.referenceDate.difference(_startedHomelessDate).inDays;
      if (differenceDate < 0) {
        this.referenceDate = _startedHomelessDate;
      }
    }
    
    var _announcementDate = getDateTime(this.announcementDate);
    return _announcementDate.difference(this.referenceDate).inDays ~/ 360;
  }

  HomelessDate({this.announcementDate, this.birthDay, this.marriageDate, this.startedHomeless});
}

