import 'package:flutter/material.dart';
import 'package:getxfavitems/components/textfield_component.dart';

class Textfield_with_dropdown extends StatefulWidget {
  const Textfield_with_dropdown({super.key});

  @override
  State<Textfield_with_dropdown> createState() =>
      _Textfield_with_dropdownState();
}

class _Textfield_with_dropdownState extends State<Textfield_with_dropdown> {
  @override
  Widget build(BuildContext context) {
    TextEditingController roleController = TextEditingController();
    bool showDropdown = false;
    List<String> roleList = ['Teacher', 'Student'];
    String selectedRole = '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoTextfomField(
            labelText: "What's your role?",
            fieldController: roleController,
            keyboardtype: TextInputType.text,
            onChanged: (value) {
              roleController.text = value!;
            },
            validator: (value) {
              return value!.isEmpty ? 'Enter your role' : null;
            },
            suffixicon: PopupMenuButton<String>(
                onOpened: () {
                  setState(() {
                    showDropdown = true;
                  });
                },
                onCanceled: () {
                  setState(() {
                    showDropdown = false;
                  });
                },
                icon: Icon(showDropdown == true
                    ? Icons.arrow_drop_down_sharp
                    : Icons.arrow_drop_up_sharp),
                onSelected: (value) {
                  selectedRole = value;
                  roleController.text = value;
                },
                itemBuilder: (context) {
                  return roleList
                      .map((String item) =>
                          PopupMenuItem<String>(value: item, child: Text(item)))
                      .toList();
                }),

            //IconButton(
            //     onPressed: () {
            //       setState(() {
            //         showDropdown = true;
            //       });
            //       AnimatedContainer(
            //         duration: const Duration(milliseconds: 300),
            //         height: 75,
            //         child: ListView.builder(
            //             itemCount: roleList.length,
            //             itemBuilder: (context, index) {
            //               return GestureDetector(
            //                 onTap: () {
            //                   setState(() {
            //                     roleController.text =
            //                         roleList[index];
            //                     showDropdown = false;
            //                   });
            //                 },
            //               );
            //             }),
            //       );
            //     },
            //     icon: Icon(showDropdown
            //         ? Icons.arrow_drop_down_sharp
            //         : Icons.arrow_drop_up_sharp))
          ),
        ],
      ),
    );
  }
}
