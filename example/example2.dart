import 'package:notelib/pdfium/lib/pdfium_bindings.dart';

PdfiumWrap? pdfium;
void main() {
  pdfium = PdfiumWrap();

  /*pdfium
      .loadDocumentFromPath('1417.pdf')
      .loadPage(0)
      .savePageAsPng('out.png')
      .dispose();*/
  loop();
  pdfium!.dispose();
}

int count = 0;
void loop() {
  pdfium!.closeDocument();
  pdfium!.loadDocumentFromPath('1417.pdf');

  final pageCount = pdfium!.getPageCount();
  for (var i = 0; i < pageCount; i++) {
    pdfium!
        .loadPage(i)
        .savePageAsPng('out.png', width: 1080, height: 1920, scale: 2)
        .closePage();
  }
  count++;
  if (count == 1000) {
    return;
  }
  loop();
}
