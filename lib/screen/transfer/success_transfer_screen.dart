part of screen;

class TransferSuccess extends StatelessWidget {
  final TransferModel transfer;
  const TransferSuccess({super.key, required this.transfer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7BC0FF),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 25.h),
        child: CustomButton(
          backgroundColor: whiteColor,
          width: double.infinity,
          height: 50.h,
          child: Text(
            'Simpan Sebagai Favorit',
            style: fontTextStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 75.h,
            ),
            Image.asset(
              'assets/Group 24.png',
              width: 120.w,
              height: 120.h,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 30.w,
                      top: 36.h,
                      right: 30.w,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            20.w,
                            30.h,
                            20.w,
                            15.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nominal Transfer',
                                style: fontTextStyle.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'Rp. ${transfer.nominal!.replaceAll(',', '.')}',
                                style: fontTextStyle.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                              SizedBox(height: 13.h),
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: greyColor),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image:
                                            AssetImage(transfer.bank!.gambar!),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transfer.namaPengirim!,
                                        style: fontTextStyle.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: blackColor,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        'Bank ${transfer.bank!.namaBank} - ${transfer.noRek}',
                                        style: fontTextStyle.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFAFADAD),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: greyColor,
                        ),
                        SizedBox(height: 14.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tipe Transaksi',
                                style: fontTextStyle.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: greyColor,
                                ),
                              ),
                              Text(
                                'BI-FAST',
                                style: fontTextStyle.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Divider(
                          thickness: 1,
                          color: greyColor,
                        ),
                        SizedBox(height: 14.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'No. Ref',
                                style: fontTextStyle.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: greyColor,
                                ),
                              ),
                              Text(
                                '1695 2723 1232 7771',
                                style: fontTextStyle.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 23.h),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            title: Text(
                              'Detail',
                              style: fontTextStyle.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Nominal Transfer',
                                      style: fontTextStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: greyColor,
                                      ),
                                    ),
                                    Text(
                                      'Rp. ${transfer.nominal!.replaceAll(',', '.')}',
                                      style: fontTextStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 14.h),
                              Divider(
                                thickness: 1,
                                color: greyColor,
                              ),
                              SizedBox(height: 14.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Biaya Admin',
                                      style: fontTextStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: greyColor,
                                      ),
                                    ),
                                    Text(
                                      'Rp. 2.500',
                                      style: fontTextStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 14.h),
                              Divider(
                                thickness: 1,
                                color: greyColor,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: fontTextStyle.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        decimalDigits: 0,
                                        symbol: 'Rp. ')
                                    .format(int.parse(transfer.nominal!
                                            .replaceAll(',', '')) +
                                        2500),
                                style: fontTextStyle.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 36.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
