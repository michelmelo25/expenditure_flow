import 'package:expenseflow/core/config/consts/app_colors.dart';
import 'package:expenseflow/core/config/consts/app_strings.dart';
import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:expenseflow/modules/insert_expense/controller/insert_expense_controller.dart';
import 'package:expenseflow/modules/insert_expense/widgets/button_navigation_widget.dart';
import 'package:expenseflow/shared/Models/category_model.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
import 'package:expenseflow/shared/Widgets/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InsertExpensePage extends StatefulWidget {
  final InsertExpenseController controller;
  final ExpenseModel? expense;
  const InsertExpensePage(this.controller, {this.expense, Key? key})
      : super(key: key);

  @override
  _InsertExpensePageState createState() => _InsertExpensePageState();
}

class _InsertExpensePageState extends State<InsertExpensePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController newCategoryController = TextEditingController();

  bool paid = false;

  bool visible = false;

  int categorySelected = -1;

  @override
  void initState() {
    super.initState();
    widget.controller.initCategorys(widget.expense);
    if (widget.expense != null) {
      nameController.text = widget.expense!.name;
      valueController.text = widget.expense!.value.toString();
      dueDateController.text = widget.expense!.dueDate;
      categoryController.text = widget.expense?.category ?? '';
      paid = widget.expense!.paid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: buidBody(context),
      bottomNavigationBar: ButtonNavigationWidget(
        onPressedPrimary: () async {
          if (widget.expense == null) {
            await widget.controller.saveExpense(ExpenseModel(
              name: nameController.text,
              value: double.parse(valueController.text),
              dueDate: dueDateController.text,
              category: categoryController.text,
              paid: paid,
            ));
            Modular.to.pop(true);
          } else {
            await widget.controller.editExpense(ExpenseModel(
              id: widget.expense!.id,
              name: nameController.text,
              value: double.parse(valueController.text),
              dueDate: dueDateController.text,
              category: categoryController.text,
              paid: paid,
            ));
            Modular.to.pop(true);
          }
        },
        onPressedSecond: () {
          Modular.to.pop(false);
        },
      ),
    );
  }

  Widget buidBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Text("Peencha os dados da despesa",
                  style: AppStyles.trailingRegular),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Column(children: [
                  InputTextWidget(
                    label: "Nome da despesa",
                    controller: nameController,
                    icon: Icons.description_outlined,
                    onChanged: (value) {},
                  ),
                  InputTextWidget(
                    controller: dueDateController,
                    label: "Data",
                    icon: Icons.calendar_today_outlined,
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) {},
                  ),
                  InputTextWidget(
                    controller: valueController,
                    label: "Valor",
                    icon: Icons.attach_money_outlined,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                  InputTextWidget(
                    controller: categoryController,
                    label: "Categoria",
                    icon: Icons.category_outlined,
                    readOnly: true,
                    onChanged: (value) {},
                    onTap: () {
                      setState(() {
                        visible = true;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Icon(Icons.payment_outlined,
                                color: AppColors.primary),
                          ),
                          Container(
                            width: 1,
                            height: 48,
                            color: AppColors.stroke,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text("Pago?", style: AppStyles.input),
                          )
                        ],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Checkbox(
                            value: paid,
                            onChanged: (status) {
                              setState(() {
                                paid = status!;
                              });
                            }),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: AppColors.stroke,
                  ),
                ]),
              )
            ],
          ),
          categoryList(context),
        ],
      ),
    );
  }

  // -------------------------------no----------------------------
  Widget categoryList(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: visible,
          child: Container(
            height: 500,
            width: 400,
            child: Card(
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Text(
                          "Selecione uma categoria",
                          style: AppStyles.titleListTile,
                        ),
                      ),
                    ],
                  ),
                  // ------------------------
                  Container(
                    alignment: Alignment.center,
                    height: 350,
                    margin: EdgeInsets.only(top: 50),
                    child: ListView.builder(
                        itemCount: widget.controller.categorys.length,
                        itemBuilder: (_, index) {
                          return Card(
                            child: ListTile(
                              trailing: Checkbox(
                                  value: categorySelected == index,
                                  onChanged: (status) {
                                    setState(() {
                                      if (status!) {
                                        categorySelected = index;
                                      } else {
                                        categorySelected = -1;
                                        categoryController.clear();
                                      }
                                    });
                                  }),
                              title:
                                  Text(widget.controller.categorys[index].name),
                            ),
                          );
                        }),
                  ),
                  // ---------------------------------
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: newCategoryController,
                          decoration: InputDecoration(
                            labelText: "Nova Categoria",
                            labelStyle: AppStyles.input,
                            icon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Icon(
                                    Icons.category_outlined,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Container(
                                  height: 48,
                                  width: 1,
                                  color: AppColors.stroke,
                                )
                              ],
                            ),
                          ),
                        )),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 48,
                              width: 1,
                              color: AppColors.stroke,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: IconButton(
                                tooltip: AppStrings.addNovaCategoria,
                                onPressed: () async {
                                  setState(() {
                                    visible = false;
                                    categoryController.text =
                                        newCategoryController.text;
                                    if (categorySelected != -1) {
                                      categoryController.text = widget
                                          .controller
                                          .categorys[categorySelected]
                                          .name;
                                    }
                                  });
                                  if (newCategoryController.text.isNotEmpty) {
                                    categoryController.text =
                                        newCategoryController.text;
                                    await widget.controller.addCategory(
                                        CategoryModel(
                                            name: newCategoryController.text));
                                  }
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
