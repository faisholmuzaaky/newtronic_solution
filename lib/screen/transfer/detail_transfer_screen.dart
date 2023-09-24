part of screen;

class DetailTransfer extends StatefulWidget {
  final TransferModel transfer;
  const DetailTransfer({super.key, required this.transfer});

  @override
  State<DetailTransfer> createState() => _DetailTransferState();
}

class _DetailTransferState extends State<DetailTransfer> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nominalController = TextEditingController();
  TextEditingController catatanController = TextEditingController();

  bool isActiveButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
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
              SizedBox(height: 37.h),
              Expanded(child: detail()),
              buttonLanjut(),
              SizedBox(height: 49.h)
            ],
          ),
        ),
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
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios,
          color: primaryColor,
        ),
      ),
    );
  }

  Widget detail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/LOGO Newtronic_O-05 1 (1).png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Newtronic Account',
                      style: fontTextStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '1234 1234 1234',
                      style: fontTextStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFAFADAD),
                      ),
                    )
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_outlined)
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(widget.transfer.bank!.gambar!),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bekamenga',
                    style: fontTextStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Bank ${widget.transfer.bank!.namaBank} - ${widget.transfer.noRek}',
                    style: fontTextStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFAFADAD),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 75.h),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nominalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Nominal',
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 30,
                      minHeight: 30,
                    ),
                    prefixIcon: Container(
                      width: 0,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Rp. ',
                        style: fontTextStyle.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFAFADAD),
                        ),
                      ),
                    ),
                    hintStyle: fontTextStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFAFADAD),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CustomInputFormatterCurrency()
                  ],
                  validator: (value) {
                    final nominal = int.parse(value!.replaceAll(',', ''));
                    if (nominal < 10000) {
                      return 'Min. transfer Rp. 10.000';
                    }
                    if (nominal > 500000000) {
                      return 'Max. transfer Rp. 500.000.000';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (nominalController.text.isNotEmpty) {
                      isActiveButton = true;
                    } else {
                      isActiveButton = false;
                    }
                    setState(() {});
                  },
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Saldo Newtronic Account',
                      style: fontTextStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFCECFD3),
                      ),
                    ),
                    Text(
                      'Rp. 28.000.000',
                      style: fontTextStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFCECFD3),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 35.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tipe Transaksi',
                style: fontTextStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFCECFD3),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Text(
                    'BI-FAST',
                    style: fontTextStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(width: 34.w),
                  Text(
                    'Rp. 2.500',
                    style: fontTextStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF38653C),
                    ),
                  ),
                ],
              ),
              Divider(
                color: greyColor,
                thickness: 2,
              ),
            ],
          ),
          SizedBox(height: 36.h),
          TextFormField(
            controller: catatanController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Catatan (Opsional)',
              prefixIconConstraints: const BoxConstraints(
                minWidth: 30,
                minHeight: 30,
              ),
              hintStyle: fontTextStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFAFADAD),
              ),
            ),
            validator: (value) {
              if (value!.length > 20) {
                return 'Maksimal 20 chars';
              }
              return null;
            },
          ),
        ],
      ),
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
                  final transfer = widget.transfer.copyWith(
                    namaPengirim: 'Bekamenga',
                    nominal: nominalController.text,
                    catatan: catatanController.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferSuccess(transfer: transfer),
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
}
