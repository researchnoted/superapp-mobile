import 'package:superapp_mobile/presentation/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CustomPDFViewer extends StatefulWidget {
  final String url;
  const CustomPDFViewer({Key? key, required this.url}) : super(key: key);

  @override
  State<CustomPDFViewer> createState() => _CustomPDFViewerState();
}

class _CustomPDFViewerState extends State<CustomPDFViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  late PdfViewerController _pdfViewerController;
  int totalPages = 0;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext thiscontext) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 27.sp, bottom: 44.sp),
          color: Colors.grey[350],
          child: SfPdfViewer.network(
            widget.url,
            // headers: appHeaders,
            key: _pdfViewerKey,
            canShowScrollHead: false,
            // onDocumentLoaded: (page) {
            //   totalPages = page.document.pages.count;
            //   BlocProvider.of<PdfviewerBloc>(thiscontext)
            //     ..add(ChangePagePDFEvent(
            //         nextPages: (totalPages >= 1) ? 1 : 0,
            //         totalPages: totalPages));
            // },
            // onDocumentLoadFailed: (error) {
            //   print(error.description);
            // },
            // onPageChanged: (page) {
            //   BlocProvider.of<PdfviewerBloc>(thiscontext)
            //     ..add(ChangePagePDFEvent(
            //         nextPages: page.newPageNumber, totalPages: totalPages));
            // },

            controller: _pdfViewerController,
            scrollDirection: PdfScrollDirection.horizontal,
            pageLayoutMode: PdfPageLayoutMode.single,
            pageSpacing: 29.w,
            onTextSelectionChanged: (select) {
              // Clipboard.setData(new ClipboardData(text: select.selectedText));
            },
            // initialZoomLevel: 0,
          ),
        ),
        Container(
          width: double.infinity,
          height: 44.sp,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
          child: Center(
            child: Text(
                    "TEST",
                    style: textStyleSmallParagraph.copyWith(color: white),
                  )
          ),
        ),
      ],
    );
  }
}
