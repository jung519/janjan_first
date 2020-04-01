import 'package:flutter/material.dart';

Widget homeOwner() {
  return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87),
        children: <TextSpan>[
          TextSpan(text: '청약신청자의 만60세 이상의 직계존속이 주택 또는 분양권등을 소유한 경우에는 주택을 소유하지 않은 것으로 인정합니다. 단, 공공임대주택 및 노부모부양 특별공급등의 청약 시에는 주택을 소유(분양권등 포함)한 것으로 봅니다.분양권등을 갖고 있거나 주택 또는 분양권등의 공유지분을 소유한 경우에는 주택을 소유하는 것으로 보되, 주택소유여부 판정기준(주택공급에 관한 규칙 제53조의 각호)의 어느 하나에 해당하거나 소형 저가주택을 무주택자로 보는 경우는 주택을 소유하지 않은 것으로 봅니다.'),
          TextSpan(text: '\n주택공급에 관한 규칙 제53조(주택소유 여부 판정기준)'),
        ],
      ),
    );
}

Widget homelessPeriod() {
    return RichText(
    text: TextSpan(
      style: const TextStyle(color: Colors.black87),
      children: [
        TextSpan(
          text: '무주택자 여부는 세대에 속한 자 전원을 기준으로 하고, 무주택 기간은 청약신청자 및 그 배우자를 기준으로 산정하며, 미혼인 경우에는 만 30세부터 무주택기간을 산정합니다.'
        ),
      ]
    ),
  );
}

Widget numOfFamily() {
    return RichText(
    text: TextSpan(
      style: const TextStyle(color: Colors.black87),
      children: [
        TextSpan(
          text: '배우자'
        ),
        TextSpan(
          text: '\n직계존속 - 청약신청자가 세대주여야 하며 3년 이상 동일 주민등록표에 등재된 직계존속'
        ),
        TextSpan(
          text: '\n직계비속 - 동일 주민등록표에 등재된 만 30세 미만의 미혼 직계비속. 다만, 만 30세 이상의 미혼 직계비속은 1년 이상 동일 주민등록표에 등재된 경우에만 부양가족으로 인정'
        ),
      ]
    ),
  );
}

Widget createAccountDate() {
  return RichText(
    text: TextSpan(
      style: const TextStyle(color: Colors.black87),
      children: [
        TextSpan(
          text: '- 입주자모집공고일 현재 입주자저축 가입자의 가입기간을 기준으로 하며, 입주자저축의 종류, 금액, 가입자 명의변경을 한 경우에도 최초 가입일을 기준으로 가입기간을 산정합니다.\n'
        ),
        TextSpan(
          text: '- 실제 청약신청 시에는 청약통장 가입일(기간)이 자동 입력됩니다.'
        )
      ]
    ),
  );
}
