import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class taskItem extends StatelessWidget {
  var task;

  taskItem({
    required this.task,
    super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Slidable(
            startActionPane:
                ActionPane(motion: DrawerMotion(), extentRatio: .7, children: [
              SlidableAction(
                onPressed: (context) {
                  // Firebasefunctions.deleteTask(taskModel.id);
                },
                backgroundColor: Colors.red,
                label: "Delete",
                icon: Icons.delete,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                ),
              ),
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Color(0xff6750a4),
                label: "Edit",
                icon: Icons.edit,
              ),
            ]),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 19),
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff6750a4),
                        borderRadius: BorderRadius.circular(20)),
                    height: 60,
                    width: 5,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("title",style: TextStyle(fontSize: 20),),
                        Text("discreption"),

                        // Text(taskModel.title ?? "",
                        //     style: TextStyle(color: Colors.blue, fontSize: 20)),
                        // Text(taskModel.description ?? "",
                        //     style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    decoration: BoxDecoration(
                        color: Color(0xff6750a4),
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(Icons.done, color: Colors.white, size: 30),
                  )
                ],
              ),
            )
        )
    );
  }
}
