import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_with_provider/pages/add_task.dart';
import 'package:sqflite_with_provider/pages/all_tasks_page.dart';
import 'package:sqflite_with_provider/pages/complete_tasks.dart';
import 'package:sqflite_with_provider/pages/incomplete_tasks.dart';
import '../provider.dart';



class TabBarPage extends StatefulWidget {

  TabBarPage();
  TabController tabController;
  @override
  TabParState createState() => TabParState();
}
class TabParState extends State<TabBarPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
  return DefaultTabController(
    length: 3,
      child: Consumer<TaskProvider>(
        builder:(a,b,c){
          b.getData();
          return Scaffold(
          appBar: AppBar(title: Text("To Do App"),
            bottom: TabBar(
              tabs: [
              Tab(child: Text("All task"),), Tab(child: Text("Complete task"),), Tab(child: Text("In complete task"),),
            ],
            ),),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              AllTasksPage(),
              CompleteTasks(),
              InCompleteTasks(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AddTask();
              }));
            },
            child: Icon(Icons.add,color: Colors.white,),
            backgroundColor: Colors.blue,
          ),

        );}
      ));
  }

}