import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:flutter_dating_template/wcao/kit/index.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';

/// HACK: 消息-聊天

class MessageChat extends StatefulWidget {
  const MessageChat({Key? key}) : super(key: key);

  @override
  State<MessageChat> createState() => _MessageChatState();
}

class _MessageChatState extends State<MessageChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friend name'),
        actions: [
          IconButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Pull black"),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Report",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                      CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: WcaoTheme.placeholder),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.more_horiz),
          )
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        child: TextField(
          keyboardType: TextInputType.text,
          obscureText: false,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: "Send a message...",
            contentPadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 24,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemBuilder: (context, index) {
            return msgItem(index, reversed: !(index % 2 == 0));
          },
        ),
      ),
    );
  }

  Container msgItem(int index, {bool? reversed = false}) {
    bool right = index % 2 == 0;

    List<Widget> _temp = [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: right
              ? const EdgeInsets.only(right: 12)
              : const EdgeInsets.only(left: 12),
          child: Text(
            mock.cparagraph(min: 1, max: 3),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      CircleAvatar(
        backgroundImage: NetworkImage(
          WcaoUtils.getRandomImage(),
        ),
      )
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment:
            right ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: reversed == true ? _temp.reversed.toList() : _temp,
      ),
    );
  }
}
