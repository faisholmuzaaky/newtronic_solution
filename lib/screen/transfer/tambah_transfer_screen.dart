// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

part of screen;

class TambahTransfer extends StatefulWidget {
  const TambahTransfer({super.key});

  @override
  State<TambahTransfer> createState() => _TambahTransferState();
}

class _TambahTransferState extends State<TambahTransfer> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaBankController = TextEditingController();
  TextEditingController nomorRekeningController = TextEditingController();
  TextEditingController searchBankController = TextEditingController();
  int selectedTab = 0;
  List<String> listTabBar = ['Rekening', 'Favorit'];

  bool isActiveButton = false;

  List<BankModel> listBank = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buttonBack(),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              'Transfer',
              style: fontTextStyle.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
          ),
          tabBar(),
          Expanded(
            child: formRekening(),
          ),
          buttonLanjut(),
          SizedBox(height: 49.h)
        ],
      ),
    );
  }

  Widget buttonBack() {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
        top: 87.h,
      ),
      child: GestureDetector(
        onTap: () {
          context.read<TransferCubit>().emit(TransferInitial());
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: primaryColor,
        ),
      ),
    );
  }

  Widget tabBar() {
    return Container(
      margin: EdgeInsets.only(
        left: 30.w,
        top: 33.h,
        right: 30.w,
        bottom: 25.h,
      ),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: const Color(0xFFEEEEEE),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            listTabBar.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 59.w, vertical: 11.h),
                decoration: BoxDecoration(
                  color: selectedTab == index ? whiteColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Text(
                  listTabBar[index],
                  style: fontTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: selectedTab == index
                        ? blackColor
                        : const Color(0xFFAFADAD),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget formRekening() {
    return BlocBuilder<TransferCubit, TransferState>(
      builder: (context, state) {
        if (state is TransferSelectedBank) {
          namaBankController.text = 'Bank ${state.bank.namaBank!}';
        }
        return Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(
                      controller: namaBankController,
                      readOnly: true,
                      enabled: true,
                      style: fontTextStyle.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nama Bank',
                        hintStyle: fontTextStyle.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFAFADAD),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () => showSheet(),
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24,
                            color: greyColor,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: blackColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: blackColor),
                        ),
                      ),
                      onChanged: (value) {
                        if (namaBankController.text.isNotEmpty ||
                            nomorRekeningController.text.isNotEmpty) {
                          isActiveButton = true;
                        } else {
                          isActiveButton = false;
                        }
                        setState(() {});
                      },
                      onTap: () => showSheet(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Bagian ini tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 22.h),
                    TextFormField(
                      controller: nomorRekeningController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'No. Rekening',
                        hintStyle: fontTextStyle.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFAFADAD),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CustomInputFormatterRekening()
                      ],
                      onChanged: (value) {
                        if (namaBankController.text.isNotEmpty ||
                            nomorRekeningController.text.isNotEmpty) {
                          isActiveButton = true;
                        } else {
                          isActiveButton = false;
                        }
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Bagian ini tidak boleh kosong';
                        }
                        if (value.replaceAll(' ', '').length < 12 ||
                            value.replaceAll(' ', '').length > 12) {
                          return 'Nomor rekening tediri 12 angka';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buttonLanjut() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: CustomButton(
        backgroundColor: isActiveButton ? primaryColor : greyColor,
        width: double.infinity,
        height: 50.h,
        onPressed: isActiveButton
            ? () {
                if (_formKey.currentState!.validate()) {
                  final transfer = TransferModel(
                    bank: (context.read<TransferCubit>().state
                            as TransferSelectedBank)
                        .bank,
                    noRek: nomorRekeningController.text,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailTransfer(transfer: transfer),
                    ),
                  );
                }
              }
            : null,
        child: Text(
          'Lanjut',
          style: fontTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  showSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            searchBankController.clear();
            Navigator.pop(context);
          },
          behavior: HitTestBehavior.opaque,
          child: GestureDetector(
            onTap: () {},
            child: DraggableScrollableSheet(
              initialChildSize: 0.8,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Center(
                        child: Container(
                          height: 3,
                          width: 50,
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30.w,
                          top: 25.h,
                          right: 30.w,
                        ),
                        child: Text(
                          'Nama Bank',
                          style: fontTextStyle.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),
                        ),
                      ),
                      searchBar(),
                      Builder(builder: (context) {
                        if (searchBankController.text.isEmpty) {
                          listBank = listBankMock;
                        } else {
                          listBank = listBankMock
                              .where((element) =>
                                  element.namaBank!.toLowerCase() ==
                                  searchBankController.text.toLowerCase())
                              .toList();
                        }
                        return (listBank.isNotEmpty ||
                                searchBankController.text.isEmpty)
                            ? Column(
                                children: List.generate(
                                  listBank.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      context
                                          .read<TransferCubit>()
                                          .selectedBank(bank: listBank[index]);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: 30.w,
                                        right: 30.w,
                                        bottom: 20.h,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              // shape: BoxShape.circle,
                                              borderRadius:
                                                  BorderRadius.circular(50.r),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    listBank[index].gambar!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 11.w,
                                          ),
                                          Text(
                                            'Bank ${listBank[index].namaBank!}',
                                            style: fontTextStyle.copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  const Icon(
                                    Icons.warning_amber_outlined,
                                    size: 64,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                      'Bank ${searchBankController.text} tidak ditemukan')
                                ],
                              );
                      })
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 20.h,
      ),
      child: CustomTextFormField(
        controller: searchBankController,
        height: 50.h,
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 25.w,
            top: 11.h,
            right: 15.w,
            bottom: 11.h,
          ),
          child: Image.asset(
            'assets/Vector (5).png',
            width: 24,
          ),
        ),
        hintText: 'Cari',
        hintStyle: fontTextStyle.copyWith(
          fontSize: 20.sp,
          color: const Color(0xFFAFADAD),
          fontWeight: FontWeight.w500,
        ),
        fillColor: const Color(0xFFEEEEEE),
        borderSide: false,
      ),
    );
  }
}
