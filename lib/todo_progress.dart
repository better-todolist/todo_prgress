library todo_progress;

import 'package:flutter/material.dart';

/// Todo 的完成进度条
///
/// 具体形式参考原型项目，是一个环形进度条内嵌套完成进度 如 8/11
class TodoProgressBar extends StatefulWidget {
  /// 当全部完成时，调用该回调函数
  final Function? onFinish;

  /// 记录的完成计数
  final int finished;

  /// 记录的总共计数
  final int total;

  /// finished Setter
  set finished(int data) {
    finished = data;
  }

  /// finished Getter
  set total(int data) {
    total = data;
  }

  const TodoProgressBar(
      {super.key, this.onFinish, this.total = 0, this.finished = 0});

  @override
  State<StatefulWidget> createState() => TodoProgressBarState();
}

/// 在这里进行状态更新
///
/// 注意，需要实现以下功能
/// 1. 长按后，可以强制将 finished = total (可不考虑用户覆盖)
/// 2. 全部完成时 （finished == total） 时，调用 onFinish 回调函数，如果不是Null
/// 3. (可选) 提供style修改支持
///
/// ## Notice
/// - 改变状态的过程需要 `setState` 包裹
///
class TodoProgressBarState extends State<TodoProgressBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
