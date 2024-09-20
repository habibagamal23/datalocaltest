import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdata_app/features/home/profile.dart';
import 'package:localdata_app/features/home/widgets/note.dart';
import 'package:localdata_app/features/login_sginup/login_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:localdata_app/core/provider_task.dart';
import '../../core/local_data.dart';
import '../../core/shared.dart';
import '../add_task/add_task_page.dart';

class HomePage extends StatefulWidget{
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _name ;
  TaskProvider taskProvider = TaskProvider();

  @override
  void initState() {
    super.initState();
    initDb();
  }

  Future<void> initDb() async {
    await createDatabase();
    await Provider.of<TaskProvider>(context, listen: false).loadTask();
    loadName();
  }

  Future<void>loadName()async{
    String? name = Shared.getData(key: 'username');
    setState(() {
      _name = name;
    });
  }

  void _logout() async {
    await taskProvider.deleteAllTasks();
    await Shared.deleteData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF180e2b),
      appBar: AppBar(
        backgroundColor: Color(0xFF180e2b),
        leadingWidth: 100,
        leading:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("TO DO" ,style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold)),
        ),
        actions: [
          Icon(Icons.notification_add_rounded,color: Colors.white,),
          const SizedBox(width: 10,),
          PopupMenuButton(
                      onSelected:(value){
                      setState(() {
                       if(value == 1){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                       }
                       if(value == 2){
                         print("dark");
                       }
                       if(value == 3){
                         _logout();
                       }
                      });},
                      color: Colors.white,
                      icon: Icon(Icons.more_vert_outlined,color: Colors.white,),
                      itemBuilder: (context) => [
                        PopupMenuItem(child: Text("Profile",style: TextStyle(color: Color(0xFF180e2b)),),value: 1,),
                        PopupMenuItem(child: Text("Dark",style: TextStyle(color: Color(0xFF180e2b))),value: 2,),
                        PopupMenuItem(child: Text("LogOut",style: TextStyle(color: Color(0xFF180e2b))),value: 3,),
                      ]
          )
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text("Welcome $_name",style: TextStyle(color: Colors.white,fontSize: 15),),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      height: 40,
                      width: 300,
                      color: Color(0xFF3c1f7b),
                      child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Color(0xFF3c1f7b),
                          indicator: BoxDecoration(
                            color: Color(0xFF180e2b),
                          ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        tabs: [
                          Tab(child: Text("Schedule")),
                          Tab(child: Text("Note")),
                        ],),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 400,
                      width: double.maxFinite,
                      child: TabBarView(
                        children: [
                          SfDateRangePicker(
                             headerHeight:60,
                             toggleDaySelection:true,
                             todayHighlightColor: Color(0xFF7e64ff),
                             backgroundColor: Color(0xFF180e2b),
                             selectionColor: Color(0xFF7e64ff),
                              headerStyle:DateRangePickerHeaderStyle(textAlign: TextAlign.center,textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),backgroundColor:Color(0xFF180e2b) ),
                              monthViewSettings:DateRangePickerMonthViewSettings(
                                  dayFormat:'EEE',
                                  showTrailingAndLeadingDates:true,
                                  viewHeaderStyle:DateRangePickerViewHeaderStyle(
                                    textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)
                                  ),
                              ),
                              monthCellStyle:DateRangePickerMonthCellStyle(
                                  textStyle: TextStyle(color: Colors.white),
                                  todayTextStyle:TextStyle(color: Colors.white),
                                  trailingDatesTextStyle:TextStyle(color: Colors.grey),
                                  leadingDatesTextStyle:TextStyle(color: Colors.grey),
                                  weekendTextStyle:TextStyle(color: Colors.red),
                                  specialDatesTextStyle:TextStyle(color: Color(0xFF180e2b),fontSize: 12),
                                  specialDatesDecoration:ShapeDecoration(shape: CircleBorder(),color: Color(0xFF7e64ff)),
                              ),
                          ),
                          Container(
                            height: 200,
                            width: double.maxFinite,
                            child: Note(),
                          //   child:TextFormField(
                          //   decoration:
                          //   InputDecoration(
                          //       filled: true,
                          //       fillColor: Color(0xFFccc2fe),
                          //       hintText: "Search note",
                          //       hintStyle: TextStyle(color: Colors.grey),
                          //       prefixIcon: Icon(Icons.search,color: Colors.grey,),
                          //       border: OutlineInputBorder(
                          //         borderSide: BorderSide(color: Color(0xFFccc2fe),),
                          //         borderRadius: BorderRadius.circular(20),
                          //       )
                          //   ),
                          // ),
                             )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF7e64ff),
        shape: CircleBorder(),
        child:Icon(Icons.add,color: Colors.white,),
        onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskPage()));},
         ),
    );
  }
}