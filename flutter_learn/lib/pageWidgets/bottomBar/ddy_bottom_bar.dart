import 'package:flutter/material.dart';

import 'package:flutter_learn/pageWidgets/chats/main_chats.dart';
import 'package:flutter_learn/pageWidgets/contacts/main_contacts.dart';
import 'package:flutter_learn/pageWidgets/find/main_find.dart';
import 'package:flutter_learn/pageWidgets/mine/main_mine.dart';

class DDYBottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _tabbarState();
}

class _tabbarState extends State<DDYBottomBar> {

  /// 默认选中
  int _selectedIndex = 0;
  /// 按钮文字
  final _itemTextList = ['聊天', '通讯录', '发现', '我的'];
  /// 按钮图标
  final _itemIconList = ['chats', 'contacts', 'find', 'mine'];
  /// 主体页面
  final _bodyPageList = [ChatsPage(title: "聊天"), ContactsPage(title: "通讯录"), FindPage(title: "发现"), MinePage(title: "我的")];

  /// 构建按钮
  BottomNavigationBarItem _buildBottomBarItem(int index) {

    var isSelect = index == _selectedIndex;
    var itemText = _itemIconList[index];
    var itemIcon = 'image/main_tab_' + '${_itemIconList[index]}' + '${isSelect ? '_pre.png' : '_nor.png'}';
    var itemSize = isSelect ? 34.0 : 34.0;
    var itemColor = isSelect ? Colors.cyan : Colors.grey;

    return BottomNavigationBarItem(
        icon: new Image.asset(itemIcon, width: itemSize, height: itemSize,),
        title: Text(itemText, style: TextStyle(color: itemColor),)
    );
  }
  /// 构建底部导航条
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      items: [_buildBottomBarItem(0), _buildBottomBarItem(1), _buildBottomBarItem(2), _buildBottomBarItem(3)],
      type: BottomNavigationBarType.shifting,
      onTap: _onTapToSelectItem,
      currentIndex: _selectedIndex,
      elevation: 10.0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }

  /// 构建主体页面
  Widget _buildBody() {
    // return _bodyPageList[_selectedIndex];
    return IndexedStack(
      index: _selectedIndex,
      children: _bodyPageList,
    );
  }

  /// 点击事件回调
  _onTapToSelectItem(int toIndex) {
    setState(() => _selectedIndex = toIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(), bottomNavigationBar: _buildBottomBar(),);
  }
}




