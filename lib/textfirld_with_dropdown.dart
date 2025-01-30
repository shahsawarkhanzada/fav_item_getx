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
            suffixicon: IconButton(
              icon: Icon(
                  showDropdown ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onPressed: () {
                setState(() {
                  showDropdown = !showDropdown; // Toggle dropdown visibility
                });
              },
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: showDropdown ? 120 : 0, // Show/Hide dropdown smoothly
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: showDropdown
                ? ListView.builder(
                    itemCount: roleList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(roleList[index]),
                        onTap: () {
                          setState(() {
                            roleController.text = roleList[index];
                            showDropdown =
                                false; // Hide dropdown after selection
                          });
                        },
                      );
                    },
                  )
                : null, // Avoid rendering when hidden
          ),
        ],
      ),
    );
  }
}
