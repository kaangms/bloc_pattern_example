import 'package:bloc_pattern_example/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class BlocExampleAppBar extends AppBar {
  final BuildContext context;
  final String? titleText;
  final bool isHasSearchBar;
  final bool searchStatus;
  final Function(String v)? searchList;
  final Function? changesearchStatus;

  final TextEditingController? controller;

  BlocExampleAppBar(
    this.context, {
    Key? key,
    this.titleText,
    this.isHasSearchBar = false,
    this.searchStatus = false,
    this.controller,
    this.changesearchStatus,
    this.searchList,
  }) : super(
          key: key,
          title: searchStatus || titleText == null ? const SizedBox.shrink() : Text(titleText),
          actions: [
            if (searchStatus && controller != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: SizedBox(
                    width: context.width - 50,
                    child: TextFormField(
                      autofocus: searchStatus,
                      controller: controller,
                      cursorColor: Colors.grey,
                      style: const TextStyle(color: Colors.black, fontSize: 16.0),
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.only(left: 22),
                        filled: true,
                        hoverColor: Colors.white,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1), width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1), width: 1.0),
                        ),
                        hintText: 'Kullanıcı listesinde ara....',
                        suffixIcon: const Icon(
                          Icons.search,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (v) => searchList != null ? searchList(v) : null,
                      onEditingComplete: () => changesearchStatus != null ? changesearchStatus() : null,
                    )),
              ),
            // if (!searchStatus && isHasSearchAction)
            if (!searchStatus)
              InkWell(
                onTap: () => changesearchStatus != null ? changesearchStatus() : null,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Icon(
                    Icons.search,
                    size: 32,
                  ),
                ),
              ),
          ],
        );
}
