import 'package:app/constants/layout_constants.dart';
import 'package:app/models/mission_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MissionOutboundItem extends StatefulWidget {
  const MissionOutboundItem({super.key, required this.mission});

  final Mission mission;

  @override
  State<MissionOutboundItem> createState() => _MissionOutboundItemState();
}

class _MissionOutboundItemState extends State<MissionOutboundItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: LayoutConstants.headerPaddingVertical,
        top: LayoutConstants.headerPaddingVertical,
        right: LayoutConstants.headerPaddingVertical
      ),
      child: Badge(
        label: Text('+ ${widget.mission.exp} XP'),
        alignment: Alignment.topLeft,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: LayoutConstants.brandColor
            )
          ),
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              
            },
            onLongPress: () async {
              HapticFeedback.mediumImpact();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.mission.contents ?? 'Mission Title',
                        style: TextStyle(fontSize: 18, fontVariations: LayoutConstants.fontWeightBold),
                      ),
                      SizedBox(height: 2,),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.clock, size: 12, color: Colors.black.withOpacity(0.25),),
                          SizedBox(width: 4,),
                          Text(
                            '${widget.mission.expirationDate != null ? DateFormat('MM.dd HH:mm').format(widget.mission.expirationDate!) : '알 수 없음'} 까지',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.4)
                            )
                          ),
                        ],
                      ),
                      SizedBox(height: 2,),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.share, size: 12, color: Colors.black.withOpacity(0.25),),
                          SizedBox(width: 4,),
                          Text(
                            '[${widget.mission.targetUserU?.realname ?? '알 수 없음'}] 에게 부여함',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.4)
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                  ((widget.mission.status ?? 0) == 0) ? OutlinedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('완료 처리'),
                            content: const SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  Text('해당 미션을 완료할까요?'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('취소'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('확인'),
                                onPressed: () {
                                  setState(() {
                                    widget.mission.status = 1;
                                  });
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Text('완료'),
                  ) : Transform.scale(
                    scale: 4,
                    child: Transform.translate(
                      offset: const Offset(2, 6),
                      child: FaIcon(FontAwesomeIcons.circleCheck, color: Colors.green.withOpacity(0.3))
                    ),
                  )
                ],
              )
            ),
          )
        ),
      ),
    );
  }
}