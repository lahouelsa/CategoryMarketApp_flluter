import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,//nbr de col
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 30.0,
      children: List.generate(Choises.length, (index){
        return Center(
          child: SelectCard(choice:Choises[index]),
        );
      }),
      );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({super.key,required this.choice});
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: ()=>{
         Navigator.of(context).pushNamed('/${choice.title}')
       
      },
      child: Card(
        color: const Color.fromARGB(137, 247, 242, 242),
        child: Center(
          child: Column(
            children: [
              Expanded(child: Icon(choice.icon,size: 50.0,color: choice.color8)),
              Text(choice.title,style: const TextStyle(fontSize: 20,fontWeight:FontWeight.bold))
            ],
          ),
        ), 
      ),
    );
  }
}
class Choice {
  const Choice({required this.title,required this.icon,required this.color8});
  final String title;
  final IconData icon;
    final MaterialAccentColor color8;
}
const List<Choice> Choises=[
  Choice(title: 'Home', icon: Icons.home, color8: Colors.purpleAccent),
   Choice(title: 'Categories', icon: Icons.map, color8: Colors.blueAccent),
   Choice(title: 'Documents', icon: Icons.document_scanner, color8: Colors.greenAccent),
    Choice(title: 'Products', icon: Icons.photo_album, color8: Colors.amberAccent),
     Choice(title: 'Synchronization', icon: Icons.wifi, color8: Colors.pinkAccent),
          Choice(title: 'Settings', icon: Icons.settings, color8: Colors.lightBlueAccent)
];
  


